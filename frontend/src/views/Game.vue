<script>
import "leaflet/dist/leaflet.css";
import L from "leaflet";
import { LMap, LTileLayer, LMarker } from "@vue-leaflet/vue-leaflet";
import scoreMixin from "../mixins/scoreMixin";
import { updateGame } from "../services/httpClient";
import { getGameIdentity } from "../services/authProvider";
import markerIcon2x from 'leaflet/dist/images/marker-icon-2x.png';
import markerIcon from 'leaflet/dist/images/marker-icon.png';
import markerShadow from 'leaflet/dist/images/marker-shadow.png';

export default {
  name: "Game",
  mixins: [scoreMixin],
  components: {
    LMap,
    LTileLayer,
    LMarker,
  },
  props: {
    initialGameState: {
      type: Object,
      required: true
    }
  },
  emits: ['game-finished'],
  data() {
    return {
      images: [
        {
          src: this.initialGameState?.Image1 || "https://random.imagecdn.app/500/150",
          coords: this.initialGameState?.Coords1 || [48.692000, 6.184350]
        },
        {
          src: this.initialGameState?.Image2 || "https://random.imagecdn.app/500/150",
          coords: this.initialGameState?.Coords2 || [48.692320, 6.184400]
        },
        {
          src: this.initialGameState?.Image3 || "https://random.imagecdn.app/500/150",
          coords: this.initialGameState?.Coords3 || [48.6920894, 6.184197]
        },
      ],
      currentIndex: 0,
      timer: this.initialGameState.Duree,
      mapCenter: [48.692054, 6.184417],
      selectedCoords: null,
      score: 0,
      distance: this.initialGameState.Distance,
      interval: null,
      startTime: null,
      isPaused: false,
      initialDuree: this.initialGameState.Duree,
      showingDistance: false,
      distanceText: '',
    };
  },
  computed: {
    currentRound() {
      return this.currentIndex + 1;
    },
    totalRounds() {
      return this.images.length;
    }
  },
  beforeUnmount() {
    if (this.interval) {
      clearInterval(this.interval);
    }
  },
  methods: {
    startRound() {
      this.selectedCoords = null;
      this.startTime = Date.now();
      this.timer = this.initialDuree;
      this.showingDistance = false;
      this.startTimer();
    },
    startTimer() {
      if (this.interval) clearInterval(this.interval);
      this.interval = setInterval(() => {
        if (!this.isPaused && !this.showingDistance) {
          if (this.timer > 0) {
            this.timer--;
          } else {
            this.validateGuess();
          }
        }
      }, 1000);
    },
    onMapClick(event) {
      if (!this.isPaused && !this.showingDistance) {
        this.selectedCoords = [event.latlng.lat, event.latlng.lng];
      }
    },
    async validateGuess() {
      if ((!this.selectedCoords && this.timer > 0) || this.isPaused || this.showingDistance) return;

      const timeTaken = (Date.now() - this.startTime) / 1000;
      const actualCoords = this.images[this.currentIndex].coords;


      this.showingDistance = true;


      L.marker(actualCoords).addTo(this.$refs.map.leafletObject);
      L.polyline([
        this.selectedCoords || actualCoords,
        actualCoords
      ], {
        color: 'black',
        weight: 3,
        opacity: 0.8
      }).addTo(this.$refs.map.leafletObject);

      const distance = this.selectedCoords ?
        this.getDistance(actualCoords, this.selectedCoords) :
        Infinity;
      this.distanceText = `Distance: ${distance.toFixed(2)} km`;

      if (this.selectedCoords) {
        this.score += this.calculateScore(
          actualCoords,
          this.selectedCoords,
          timeTaken,
          this.distance
        );
      }


      setTimeout(() => {
        this.$refs.map.leafletObject.eachLayer((layer) => {
          if (layer instanceof L.Polyline || (layer instanceof L.Marker && layer !== this.selectedMarker)) {
            this.$refs.map.leafletObject.removeLayer(layer);
          }
        });
        this.endRound();
      }, 5000);
    },
    async endRound() {
      clearInterval(this.interval);
      this.currentIndex++;

      if (this.currentIndex < this.images.length) {
        this.startRound();
      } else {
        const finalScore = Math.round(this.score);
        const gameData = getGameIdentity();

        if (!gameData?.game_id) {
          console.error("Pas d'ID de jeu trouvé");
          return;
        }

        try {
          await updateGame(gameData.game_id, finalScore);
          this.$emit('game-finished', finalScore);
        } catch (error) {
          console.error("Erreur:", error);
          this.$emit('game-finished', finalScore);
        }
      }
    },
    togglePause() {
      if (this.showingDistance) return;
      this.isPaused = !this.isPaused;
      if (!this.isPaused) {
        this.startTimer();
      } else {
        clearInterval(this.interval);
      }
    },
  },
  mounted() {
    delete L.Icon.Default.prototype._getIconUrl;
    L.Icon.Default.mergeOptions({
      iconRetinaUrl: markerIcon2x,
      iconUrl: markerIcon,
      shadowUrl: markerShadow,
    });
    this.startRound();
  }
};
</script>

<template>
  <div class="game-container" v-if="initialGameState">
    <div class="game-header">
      <h1 class="game-title">GeoQuizz</h1>
      <div class="game-info">
        <p class="round-display">Manche {{ currentRound }}/{{ totalRounds }}</p>
        <p class="score-display">Score : {{ Math.round(score) }}</p>
      </div>
    </div>

    <img
      v-if="images[currentIndex]"
      :src="images[currentIndex].src"
      :alt="`Image ${currentIndex + 1}`"
      class="game-image"
    />

    <div class="map-container">
      <l-map
        ref="map"
        :zoom="11"
        :center="mapCenter"
        @click="onMapClick"
        :options="{ scrollWheelZoom: true }"
      >
        <l-tile-layer
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
          attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
        />
        <l-marker v-if="selectedCoords" :lat-lng="selectedCoords"></l-marker>
      </l-map>
      <div v-if="showingDistance" class="distance-overlay">
        {{ distanceText }}
      </div>
    </div>

    <div class="game-footer">
      <div class="timer">{{ timer }}s</div>
      <div class="game-controls">
        <button
          @click="validateGuess"
          :disabled="!selectedCoords || isPaused || showingDistance"
          class="game-button validate-button"
        >
          Valider
        </button>
        <button @click="togglePause" :disabled="showingDistance" class="game-button pause-button">
          {{ isPaused ? "Reprendre" : "Pause" }}
        </button>
      </div>
    </div>

    <div v-if="isPaused" class="pause-overlay">
      <div class="pause-menu">
        <h2>Jeu en pause</h2>
        <button @click="togglePause" class="game-button">
          Reprendre la partie
        </button>
      </div>
    </div>
  </div>
</template>

<style>

.game-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: clamp(10px, 3vw, 20px);
  text-align: center;
  position: relative;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  min-height: 100vh;
}

/* Header */
.game-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: clamp(15px, 4vw, 30px);
  background-color: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  padding: clamp(10px, 3vw, 20px);
  border-radius: clamp(8px, 2vw, 16px);
  flex-wrap: wrap;
  gap: 10px;
}

.game-title {
  color: white;
  font-size: clamp(24px, 5vw, 32px);
  font-weight: 700;
  margin: 0;
}

.game-info {
  display: flex;
  align-items: center;
  gap: clamp(10px, 2vw, 20px);
  flex-wrap: wrap;
}

.score-display, .round-display {
  color: white;
  font-size: clamp(16px, 3vw, 24px);
  font-weight: 600;
  padding: clamp(6px, 1.5vw, 8px) clamp(12px, 2vw, 16px);
  background: rgba(255, 255, 255, 0.1);
  border-radius: clamp(6px, 1.5vw, 8px);
}

/* Game Image */
.game-image {
  width: 100%;
  max-width: 600px;
  height: auto;
  border-radius: clamp(8px, 2vw, 16px);
  margin: clamp(10px, 3vw, 20px) auto;
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
  display: block;
}

/* Map Container */
.map-container {
  width: 100%;
  height: clamp(300px, 50vh, 500px);
  border-radius: clamp(8px, 2vw, 16px);
  overflow: hidden;
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
  margin: clamp(10px, 3vw, 20px) 0;
}

.map-container :deep(.leaflet-container) {
  height: 100%;
  width: 100%;
  z-index: 1;
}

/* Footer */
.game-footer {
  background-color: rgba(0, 0, 0, 0.7);
  padding: clamp(15px, 3vw, 20px);
  border-radius: clamp(8px, 2vw, 16px);
  margin-top: clamp(10px, 3vw, 20px);
}

.timer {
  font-size: clamp(32px, 6vw, 48px);
  font-weight: 700;
  color: #ffd700;
  text-shadow: 0 0 10px rgba(255, 215, 0, 0.5);
  margin-bottom: clamp(10px, 3vw, 20px);
}

.game-controls {
  display: flex;
  gap: clamp(10px, 2vw, 15px);
  justify-content: center;
  flex-wrap: wrap;
}

/* Buttons */
.game-button {
  background: linear-gradient(to right, #667eea, #764ba2);
  color: white;
  border: none;
  padding: clamp(8px, 2vw, 12px) clamp(16px, 3vw, 24px);
  border-radius: clamp(6px, 1.5vw, 8px);
  font-size: clamp(14px, 2.5vw, 16px);
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s ease;
  min-width: clamp(100px, 30%, 150px);
}

.game-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 7px 14px rgba(0, 0, 0, 0.1);
}

.game-button:disabled {
  background: linear-gradient(to right, #a0aec0, #718096);
  cursor: not-allowed;
  transform: none;
  box-shadow: none;
  opacity: 0.7;
}

.validate-button {
  background: linear-gradient(to right, #48bb78, #38b2ac);
}

.pause-button {
  background: linear-gradient(to right, #ed8936, #ed64a6);
}

/* Pause Overlay */
.pause-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.8);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 2000;
  backdrop-filter: blur(5px);
}

.pause-menu {
  background-color: white;
  padding: clamp(20px, 5vw, 40px);
  border-radius: clamp(8px, 2vw, 16px);
  text-align: center;
  width: clamp(280px, 90%, 400px);
  animation: fadeIn 0.3s ease-out;
}

.pause-menu h2 {
  margin-bottom: clamp(15px, 4vw, 20px);
  color: #333;
  font-size: clamp(18px, 4vw, 24px);
}

/* Media Queries */
@media screen and (max-width: 768px) {
  .game-header {
    flex-direction: column;
    text-align: center;
  }

  .game-info {
    justify-content: center;
    width: 100%;
  }

  .game-controls {
    flex-direction: column;
    align-items: stretch;
  }

  .game-button {
    width: 100%;
    max-width: none;
  }
}

@media screen and (max-width: 480px) {
  .map-container {
    height: 300px;
  }

  .pause-menu {
    margin: 20px;
    padding: 20px;
  }
}

/* Animations */
@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(-20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* Loading state */
.loading {
  color: white;
  font-size: clamp(16px, 3vw, 20px);
  padding: clamp(20px, 5vw, 40px);
}

.distance-overlay {
  position: absolute;
  top: 10px;
  left: 50%;
  transform: translateX(-50%);
  background: rgba(0, 0, 0, 0.8);
  color: white;
  padding: 8px 16px;
  border-radius: 4px;
  font-size: 16px;
  font-weight: bold;
  z-index: 1000;
}
</style>

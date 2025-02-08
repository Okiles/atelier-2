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
import { getImage, getIdImagesByIdLieux, getIdByTheme, getImageLongitudeByIdLieux, getImageLatitudeByIdLieux } from "../services/directus";

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
      images: [],
      currentIndex: 0,
      timer: this.initialGameState.Duree,
      mapCenter: [48.692054, 6.184417],
      selectedCoords: null,
      score: 0,
      distance: this.initialGameState.Distance,
      categorie: this.initialGameState.Categorie,
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
    async loadImages() {
      try {
        console.log("Catégorie chargée:", this.categorie);

        const response = await getIdByTheme(this.categorie);
        console.log("IDs récupérés:", response);

        if (!response?.data || response.data.length === 0) {
          throw new Error('Aucun lieu trouvé pour cette catégorie');
        }

        const imagePromises = response.data.map(async (item) => {
          try {
            const imageResponse = await getIdImagesByIdLieux(item.id);

            if (!imageResponse?.data?.[0]?.photo?.[0]?.directus_files_id) {
              console.warn('Pas d\'ID d\'image pour le lieu:', item.id);
              return null;
            }

            const [latResponse, longResponse] = await Promise.all([
              getImageLatitudeByIdLieux(item.id),
              getImageLongitudeByIdLieux(item.id)
            ]);

            if (!latResponse?.data?.[0]?.latitude || !longResponse?.data?.[0]?.longitude) {
              console.warn('Coordonnées manquantes pour le lieu:', item.id);
              return null;
            }

            return {
              src: getImage(imageResponse.data[0].photo[0].directus_files_id),
              coords: [
                parseFloat(latResponse.data[0].latitude),
                parseFloat(longResponse.data[0].longitude)
              ]
            };
          } catch (error) {
            console.error('Erreur pour le lieu', item.id, ':', error);
            return null;
          }
        });

        this.images = (await Promise.all(imagePromises)).filter(img => img !== null);
        this.images = this.shuffleArray(this.images);

        if (this.images.length === 0) {
          throw new Error('Aucune image valide trouvée pour cette catégorie');
        }

        console.log("Images chargées:", this.images);
        return this.images;
      } catch (error) {
        console.error('Erreur dans loadImages:', error);
        throw error;
      }
    },
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

      // Ajout du marqueur correct
      L.marker(actualCoords).addTo(this.$refs.map.leafletObject);

      // Ligne entre les points
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

        if (!gameData || !gameData.game_id) {
          console.error("Pas d'ID de jeu trouvé");
          return;
        }

        try {
          await updateGame(gameData.game_id, finalScore);
          this.$emit('game-finished', finalScore);
        } catch (error) {
          console.error("Erreur lors de la mise à jour du jeu:", error);
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
    shuffleArray(arr){
      for (let i = arr.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [arr[i], arr[j]] = [arr[j], arr[i]]; // Échange des éléments
      }
      return arr;
    },
  },
  mounted() {
    delete L.Icon.Default.prototype._getIconUrl;
    L.Icon.Default.mergeOptions({
      iconRetinaUrl: markerIcon2x,
      iconUrl: markerIcon,
      shadowUrl: markerShadow,
    });

    this.loadImages()
      .then(() => {
        this.startRound();
      })
      .catch(error => {
        console.error("Erreur lors du chargement des images:", error);
      });
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

    <div v-if="images[currentIndex]" class="image-container">
      <img
        :src="images[currentIndex].src"
        :alt="`Image ${currentIndex + 1}`"
        class="game-image"
      />
    </div>

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
  padding: 20px;
  text-align: center;
  position: relative;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  min-height: 100vh;
}

.game-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 30px;
  background-color: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  padding: 20px;
  border-radius: 16px;
}

.game-title {
  color: white;
  font-size: 32px;
  font-weight: 700;
  margin: 0;
}

.score-display {
  color: white;
  font-size: 24px;
  font-weight: 600;
}

.start-screen {
  background-color: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  padding: 40px;
  border-radius: 16px;
  margin: 100px auto;
  max-width: 600px;
}

.start-screen h2 {
  color: white;
  font-size: 28px;
  margin-bottom: 20px;
}

.start-screen p {
  color: white;
  font-size: 18px;
  margin-bottom: 30px;
}

.start-button {
  background: linear-gradient(to right, #48bb78, #38b2ac);
  font-size: 20px;
  padding: 15px 40px;
}

.timer {
  font-size: 48px;
  font-weight: 700;
  color: #ffd700;
  text-shadow: 0 0 10px rgba(255, 215, 0, 0.5);
  margin-bottom: 20px;
}

.game-image {
  width: 100%;
  max-width: 600px;
  height: auto;
  border-radius: 16px;
  margin: 20px auto;
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
  display: block;
}

.map-container {
  width: 100%;
  height: 500px;
  border-radius: 16px;
  overflow: hidden;
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
  margin: 20px 0;
}

.map-container :deep(.leaflet-container) {
  height: 100%;
  width: 100%;
  z-index: 1;
}

.game-footer {
  background-color: rgba(0, 0, 0, 0.7);
  padding: 20px;
  border-radius: 16px;
  margin-top: 20px;
}

.game-controls {
  display: flex;
  gap: 15px;
  justify-content: center;
}

.game-button {
  background: linear-gradient(to right, #667eea, #764ba2);
  color: white;
  border: none;
  padding: 12px 24px;
  border-radius: 8px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
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
}

.validate-button {
  background: linear-gradient(to right, #48bb78, #38b2ac);
}

.pause-button {
  background: linear-gradient(to right, #ed8936, #ed64a6);
}

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
}

.pause-menu {
  background-color: white;
  padding: 40px;
  border-radius: 16px;
  text-align: center;
}

.pause-menu h2 {
  margin-bottom: 20px;
  color: #333;
}

.game-info {
  display: flex;
  align-items: center;
  gap: 20px;
}

.round-display {
  color: white;
  font-size: 24px;
  font-weight: 600;
  padding: 8px 16px;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 8px;
}
</style>

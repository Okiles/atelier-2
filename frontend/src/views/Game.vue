<script>
import "leaflet/dist/leaflet.css";
import L from "leaflet";
import { LMap, LTileLayer, LMarker } from "@vue-leaflet/vue-leaflet";
import scoreMixin from "../mixins/scoreMixin";
import {getGameState} from "../services/httpClient.js";
import {getGameIdentity} from "@/services/authProvider.js";

export default {
  name: "Game",
  mixins: [scoreMixin],
  components: {
    LMap,
    LTileLayer,
    LMarker,
  },
  data() {
    return {
      images: [
        { src: "https://random.imagecdn.app/500/150", coords: [48.8566, 2.3522] },
        { src: "https://random.imagecdn.app/500/150", coords: [40.7128, -74.006] },
        { src: "https://random.imagecdn.app/500/150", coords: [34.0522, -118.2437] },
      ],
      currentIndex: 0,
      timer: null,
      mapCenter: [48.692054, 6.184417],
      selectedCoords: null,
      score: 0,
      distance: null,
      interval: null,
      startTime: null,
      isPaused: false,
      isGameStarted: false,
      isGameFinished: false,
      finalScore: 0,
    };
  },
  beforeUnmount() {
    if (this.interval) {
      clearInterval(this.interval);
    }
  },
  methods: {
    async startGame() {
      try {
        const gameData = getGameIdentity();
        console.log(gameData.game_id);

        const responseGameState = await getGameState(gameData.game_id);

        console.log(responseGameState);

        this.distance = responseGameState.Distance;
        this.timer = responseGameState.Duree;
        this.isGameStarted = true;
        this.currentIndex = 0;
        this.score = 0;
        this.isGameFinished = false;
        this.startRound();
      } catch (error) {
        console.error("Erreur lors du démarrage du jeu :", error);
      }
    },
    startRound() {
      this.selectedCoords = null;
      this.startTime = Date.now();
      this.startTimer();
    },
    startTimer() {
      if (this.interval) clearInterval(this.interval);
      this.interval = setInterval(() => {
        if (!this.isPaused) {
          if (this.timer > 0) {
            this.timer--;
          } else {
            this.endRound();
          }
        }
      }, 1000);
    },
    onMapClick(event) {
      if (this.isGameStarted && !this.isPaused) {
        this.selectedCoords = [event.latlng.lat, event.latlng.lng];
      }
    },
    validateGuess() {
      if (!this.selectedCoords || this.isPaused) return;

      const timeTaken = (Date.now() - this.startTime) / 1000;
      const actualCoords = this.images[this.currentIndex].coords;
      this.score += this.calculateScore(
        actualCoords,
        this.selectedCoords,
        timeTaken,
        this.distance
      );
      this.endRound();
    },
    endRound() {
      clearInterval(this.interval);
      this.currentIndex++;

      if (this.currentIndex < this.images.length) {
        this.startRound();
      } else {
        this.finishGame();
      }
    },
    finishGame() {
      this.finalScore = Math.round(this.score);
      this.isGameFinished = true;
      this.isGameStarted = false;
    },
    returnHome() {
      this.$router.push("/");
    },
    togglePause() {
      this.isPaused = !this.isPaused;
      if (!this.isPaused) {
        this.startTimer();
      } else {
        clearInterval(this.interval);
      }
    },
  },
};
</script>

<template>
  <div class="game-container">
    <div class="game-header">
      <h1 class="game-title">GeoQuizz</h1>
      <p class="score-display">Score : {{ Math.round(score) }}</p>
    </div>

    <template v-if="!isGameStarted">
      <div class="start-screen">
        <h2>Bienvenue sur GeoQuizz</h2>
        <p>Êtes-vous prêt à tester vos connaissances géographiques ?</p>
        <button @click="startGame" class="game-button start-button">
          Démarrer la partie
        </button>
      </div>
    </template>

    <template v-if="isGameFinished">
      <div class="end-screen">
        <h2>Partie terminée !</h2>
        <div class="final-score">
          <span class="score-label">Score final</span>
          <span class="score-value">{{ finalScore }}</span>
        </div>
        <button @click="returnHome" class="game-button return-button">
          Retour à l'accueil
        </button>
      </div>
    </template>

    <template v-else>
      <img
        :src="images[currentIndex].src"
        :alt="`Image ${currentIndex + 1}`"
        class="game-image"
      />

      <div class="map-container">
        <l-map
          :zoom="5"
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
      </div>

      <div class="game-footer">
        <div class="timer">{{ timer }}s</div>
        <div class="game-controls">
          <button
            @click="validateGuess"
            :disabled="!selectedCoords || isPaused"
            class="game-button validate-button"
          >
            Valider
          </button>
          <button @click="togglePause" class="game-button pause-button">
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
    </template>
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
}

.map-container {
  width: 100%;
  height: 500px;
  border-radius: 16px;
  overflow: hidden;
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
  margin: 20px 0;
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
</style>

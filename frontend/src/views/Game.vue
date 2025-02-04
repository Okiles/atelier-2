<script>
import "leaflet/dist/leaflet.css";
import L from "leaflet";
import { LMap, LTileLayer, LMarker } from "@vue-leaflet/vue-leaflet";
import scoreMixin from "../mixins/scoreMixin";

export default {
  mixins: [scoreMixin],
  components: {
    LMap,
    LTileLayer,
    LMarker,
  },
  data() {
    return {
      images: [
        { src: "image1.jpg", coords: [48.8566, 2.3522] },
        { src: "image2.jpg", coords: [40.7128, -74.006] },
        { src: "image3.jpg", coords: [34.0522, -118.2437] },
      ],
      currentIndex: 0,
      timer: 10,
      mapCenter: [48.692054, 6.184417],
      selectedCoords: null,
      score: 0,
      difficulty: 1.5,
      interval: null,
      startTime: null,
    };
  },
  mounted() {
    this.startRound();
  },
  methods: {
    startRound() {
      this.selectedCoords = null;
      this.startTime = Date.now();
      this.timer = 10;
      this.interval = setInterval(() => {
        if (this.timer > 0) {
          this.timer--;
        } else {
          this.endRound();
        }
      }, 1000);
    },
    onMapClick(event) {
      this.selectedCoords = [event.latlng.lat, event.latlng.lng];
    },
    validateGuess() {
      if (!this.selectedCoords) return;
      const timeTaken = (Date.now() - this.startTime) / 1000;
      const actualCoords = this.images[this.currentIndex].coords;
      this.score += this.calculateScore(actualCoords, this.selectedCoords, timeTaken, this.difficulty);
      this.endRound();
    },
    endRound() {
      clearInterval(this.interval);
      this.currentIndex++;
      if (this.currentIndex < this.images.length) {
        this.startRound();
      } else {
        alert(`Fin du jeu ! Score final : ${this.score}`);
      }
    },
  },
};
</script>

<template>
  <div>
    <h1>GeoQuizz</h1>
    <p>Temps restant : {{ timer }}s</p>
    <p>Score : {{ score }}</p>
    <img :src="images[currentIndex].src" alt="Image à deviner" width="400" />

    <l-map :zoom="5" :center="mapCenter" style="height: 500px" @click="onMapClick">
      <l-tile-layer url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png" />
      <l-marker v-if="selectedCoords" :lat-lng="selectedCoords"></l-marker>
    </l-map>

    <button @click="validateGuess" :disabled="!selectedCoords">Valider</button>
  </div>
</template>

<style>
.game-container {
  text-align: center;
  margin: 20px;
}

button {
  margin: 10px;
  padding: 10px 15px;
  border: none;
  background-color: #007bff;
  color: white;
  font-size: 16px;
  cursor: pointer;
  border-radius: 5px;
}

button:disabled {
  background-color: gray;
  cursor: not-allowed;
}
</style>

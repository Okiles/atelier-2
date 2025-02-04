<script>
import { LMap, LTileLayer, LMarker } from "vue-leaflet";
import "leaflet/dist/leaflet.css";
import { request } from "../services/httpClient";

export default {
  components: {
    LMap,
    LTileLayer,
    LMarker,
  },
  data() {
    return {
      mapCenter: [48.692054, 6.184417],
      zoom: 13,
      selectedCoords: null,
    };
  },
  methods: {
    onMapClick(event) {
      this.selectedCoords = [event.latlng.lat, event.latlng.lng];
    },
    async sendCoords() {
      if (!this.selectedCoords) {
        alert("Veuillez sélectionner un point sur la carte.");
        return;
      }

      try {
        const response = await request("/coords", "POST", {
          latitude: this.selectedCoords[0],
          longitude: this.selectedCoords[1],
        }, true);

        alert("Coordonnées envoyées avec succès !");
      } catch (error) {
        console.error("Erreur lors de l'envoi des coordonnées :", error);
        alert("Erreur lors de l'envoi des coordonnées.");
      }
    },
  },
};
</script>

<template>
  <div class="game-container">
    <h1>Carte du jeu</h1>

    <l-map
      :zoom="zoom"
      :center="mapCenter"
      style="height: 500px"
      @click="onMapClick"
    >
      <l-tile-layer
        url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
      />
      <l-marker v-if="selectedCoords" :lat-lng="selectedCoords"></l-marker>
    </l-map>

    <p v-if="selectedCoords">
      Coordonnées sélectionnées : {{ selectedCoords[0] }}, {{ selectedCoords[1] }}
    </p>

    <button @click="sendCoords" :disabled="!selectedCoords">
      Valider mon choix
    </button>
  </div>
</template>

<style>
.game-container {
  text-align: center;
}
</style>

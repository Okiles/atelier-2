<script>
import {getGameState} from "../services/httpClient.js";

export default {
  name: 'Game',
  data() {
    return {
      error: null,
    };
  },

  methods: {
    async fetchGame() {
      try {
        const response = await getGameState(this.$route.params.id);
        this.game = response.game;
      } catch (error) {
        this.error = error.message || 'Erreur lors de la récupération de la partie';
      }
    }
  }
}
</script>

<template>
</template>

<style scoped>

</style>

<script>
import { getUserIdentity } from '../services/authProvider';
import {createGame} from '../services/httpClient';

export default {
  name: 'CreateGame',
  data() {
    return {
      user: null,
      error: null,
      selectedDistance: 100,
      selectedTime: 10,
      isSubmitting: false
    };
  },
  async mounted() {
    this.user = getUserIdentity();
  },
  methods: {
    formatDistance(value) {
      return value >= 1000 ? `${value/1000}km` : `${value}m`;
    },
    async handleSubmit() {
      this.isSubmitting = true;
      this.error = null;

      try {
        const response = await createGame(this.selectedTime, this.selectedDistance);
        this.$router.push(`/game/${response.gameId}`);
      } catch (error) {
        this.error = error.message || 'Erreur lors de la création de la partie';
      } finally {
        this.isSubmitting = false;
      }
    }
  }
}
</script>

<template>
  <div class="create-game">
    <h1>Créer une nouvelle partie</h1>

    <form @submit.prevent="handleSubmit">
      <div class="form-group">
        <label>
          Précision requise : {{ formatDistance(selectedDistance) }}
          <input
            type="range"
            v-model="selectedDistance"
            min="5"
            max="1000"
            step="5"
            class="slider"
          >
        </label>
      </div>

      <div class="form-group">
        <label>
          Temps par manche : {{ selectedTime }} secondes
          <input
            type="range"
            v-model="selectedTime"
            min="2"
            max="30"
            step="1"
            class="slider"
          >
        </label>
      </div>

      <button
        type="submit"
        :disabled="isSubmitting"
        class="submit-button"
      >
        {{ isSubmitting ? 'Création en cours...' : 'Créer la partie' }}
      </button>

      <p v-if="error" class="error">{{ error }}</p>
    </form>
  </div>
</template>

<style scoped>

</style>

<script>
import { getUserIdentity } from '../services/authProvider';
import { request, createGame } from '../services/httpClient';

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
        <div class="range-labels">
          <span>5m</span>
          <span>1km</span>
        </div>
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
        <div class="range-labels">
          <span>2s</span>
          <span>30s</span>
        </div>
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


<style scoped>
.create-game {
  max-width: 600px;
  margin: 2rem auto;
  padding: 20px;
}

.form-group {
  margin-bottom: 2rem;
}

.slider {
  width: 100%;
  margin: 10px 0;
}

.range-labels {
  display: flex;
  justify-content: space-between;
  color: #666;
  font-size: 0.9em;
}

.submit-button {
  background-color: #42b983;
  color: white;
  padding: 12px 24px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 1.1em;
}

.submit-button:disabled {
  background-color: #cccccc;
  cursor: not-allowed;
}

.error {
  color: #ff4444;
  margin-top: 1rem;
}
</style>

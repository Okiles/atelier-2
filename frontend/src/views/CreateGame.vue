<script>
import { useUserStore } from "../stores/userStore";
import { storeToRefs } from "pinia";
import { createGame } from "../services/httpClient";
import { ref } from "vue";

export default {
  name: "CreateGame",
  setup() {
    const userStore = useUserStore();
    const { user } = storeToRefs(userStore);

    const selectedDistance = ref(100);
    const selectedTime = ref(10);
    const isSubmitting = ref(false);
    const error = ref(null); //

    const formatDistance = (value) => {
      return value >= 1000 ? `${value / 1000}km` : `${value}m`;
    };

    const handleSubmit = async () => {
      isSubmitting.value = true;
      error.value = null;

      if (!user.value) {
        error.value = "Utilisateur non connecté.";
        isSubmitting.value = false;
        return;
      }

      try {
        const response = await createGame(
          selectedTime.value,
          selectedDistance.value,
          user.value.id
        );
        console.log(response);
      } catch (err) {
        error.value = err.message || "Erreur lors de la création de la partie";
      } finally {
        isSubmitting.value = false;
      }
    };

    return {
      user,
      selectedDistance,
      selectedTime,
      isSubmitting,
      error, // ✅ Retourne error pour l'utiliser dans le template
      formatDistance,
      handleSubmit,
    };
  },
};
</script>



<template>
  <div class="app-container">
    <nav class="navbar">
      <div class="navbar-brand" @click="navigateDashboard">GeoQuizz</div>
      <div class="navbar-menu">
        <div v-if="user" class="navbar-user">
          <span>{{ user.username }}</span>
        </div>
      </div>
    </nav>

    <main class="main-content">
      <div class="login-card create-game-card">
        <h1 class="login-title">Créer une nouvelle partie</h1>

        <form @submit.prevent="handleSubmit" class="create-game-form">
          <div class="form-group">
            <label class="form-label">
              Précision requise : {{ formatDistance(selectedDistance) }}
            </label>
            <input
              type="range"
              v-model="selectedDistance"
              min="5"
              max="1000"
              step="5"
              class="slider"
            >
          </div>

          <div class="form-group">
            <label class="form-label">
              Temps par manche : {{ selectedTime }} secondes
            </label>
            <input
              type="range"
              v-model="selectedTime"
              min="2"
              max="30"
              step="1"
              class="slider"
            >
          </div>

          <button
            type="submit"
            :disabled="isSubmitting"
            class="login-button create-game-button"
          >
            {{ isSubmitting ? 'Création en cours...' : 'Créer la partie' }}
          </button>

          <p v-if="error" class="error-message">{{ error }}</p>
        </form>
      </div>
    </main>
  </div>
</template>

<style scoped>
.app-container {
  font-family: 'Arial', sans-serif;
  min-height: 100vh;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 15px 5%;
  background-color: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
}

.navbar-brand {
  color: white;
  font-size: 24px;
  font-weight: 700;
  cursor: pointer;
  transition: color 0.3s ease;
}

.navbar-brand:hover {
  color: #e0e0e0;
}

.navbar-menu {
  display: flex;
  align-items: center;
}

.navbar-user {
  color: white;
}

.main-content {
  display: flex;
  justify-content: center;
  align-items: center;
  padding-top: 50px;
}

.login-card {
  background-color: white;
  border-radius: 16px;
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
  padding: 40px;
  width: 100%;
  max-width: 400px;
  text-align: center;
}

.create-game-form {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.form-group {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.form-label {
  color: #666;
  font-weight: 600;
}

.slider {
  width: 100%;
  accent-color: #667eea;
}

.login-button {
  background: linear-gradient(to right, #667eea, #764ba2);
  color: white;
  border: none;
  padding: 14px;
  border-radius: 8px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.login-button:disabled {
  opacity: 0.7;
  cursor: not-allowed;
}

.login-button:not(:disabled):hover {
  transform: translateY(-2px);
  box-shadow: 0 7px 14px rgba(0, 0, 0, 0.1);
}

.error-message {
  color: #ff4757;
  margin-top: 10px;
}
</style>

<script>
import { useUserStore } from "../stores/userStore";
import { storeToRefs } from "pinia";
import { createGame } from "../services/httpClient";
import { ref, onMounted } from "vue";
import { getGameIdentity } from "../services/authProvider";
import { useRouter } from "vue-router";
import { listCategoriesUnfiltered } from "../services/directus";

export default {
  name: "CreateGame",
  setup() {
    const userStore = useUserStore();
    const { user } = storeToRefs(userStore);

    const selectedDistance = ref(100);
    const selectedTime = ref(10);
    const isSubmitting = ref(false);
    const error = ref(null);
    const gameData = ref(null);

    const categories = ref([]);
    const selectedCategory = ref(null);
    const isLoadingCategories = ref(true); // Nouvel état de chargement des catégories

    const router = useRouter();

    // Récupération et filtrage des catégories
    const fetchCategories = async () => {
      isLoadingCategories.value = true;
      try {
        const response = await listCategoriesUnfiltered();
        if (response && response.data && Array.isArray(response.data)) {
          categories.value = [...new Set(response.data.map(item => item.categorie))];
        } else {
          console.warn("Réponse inattendue de l'API Directus :", response);
          categories.value = [];
        }
      } catch (err) {
        console.error("Erreur lors de la récupération des catégories:", err);
        categories.value = [];
      } finally {
        isLoadingCategories.value = false;
      }
    };

    const formatDistance = (value) => (value >= 1000 ? `${value / 1000}km` : `${value}m`);

    const handleSubmit = async () => {
      isSubmitting.value = true;
      error.value = null;

      console.log("Catégorie sélectionnée lors de la création:", selectedCategory.value);

      if (!user.value) {
        error.value = "Utilisateur non connecté.";
        isSubmitting.value = false;
        return;
      }

      if (!selectedCategory.value) {
        error.value = "Veuillez sélectionner une catégorie.";
        isSubmitting.value = false;
        return;
      }

      try {
        const response = await createGame(
          selectedTime.value,
          selectedDistance.value,
          user.value.id,
          selectedCategory.value
        );
        localStorage.setItem("gameToken", response.token);
        const gameData = getGameIdentity();

        if (gameData?.game_id) {
          router.push(`/game/${gameData.game_id}`);
        }
      } catch (err) {
        error.value = err.message || "Erreur lors de la création de la partie";
      } finally {
        isSubmitting.value = false;
      }
    };

    onMounted(() => {
      gameData.value = getGameIdentity();
      fetchCategories();
    });

    return {
      user,
      selectedDistance,
      selectedTime,
      isSubmitting,
      error,
      formatDistance,
      handleSubmit,
      gameData,
      categories,
      selectedCategory,
      isLoadingCategories
    };
  },
};
</script>

<template>
  <div class="app-container">
    <nav class="navbar">
      <div class="navbar-brand">GeoQuizz</div>
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
          <!-- Sélection du thème -->
          <div class="form-group">
            <label class="form-label">Thème :</label>
            <select v-model="selectedCategory" class="form-select" :disabled="isLoadingCategories">
              <option v-if="isLoadingCategories" disabled>Chargement...</option>
              <option v-else v-for="(category, index) in categories" :key="index" :value="category">
                {{ category }}
              </option>
            </select>
          </div>

          <div class="form-group">
            <label class="form-label">Précision requise : {{ formatDistance(selectedDistance) }}</label>
            <input
              type="range"
              v-model="selectedDistance"
              min="5"
              max="1000"
              step="5"
              class="slider"
            />
          </div>

          <div class="form-group">
            <label class="form-label">Temps par manche : {{ selectedTime }} secondes</label>
            <input
              type="range"
              v-model="selectedTime"
              min="2"
              max="60"
              step="1"
              class="slider"
            />
          </div>

          <button
            type="submit"
            :disabled="isSubmitting"
            class="login-button create-game-button"
          >
            {{ isSubmitting ? "Création en cours..." : "Créer la partie" }}
          </button>

          <p v-if="error" class="error-message">{{ error }}</p>
        </form>
      </div>
    </main>
  </div>
</template>

<style scoped>
.app-container {
  font-family: "Arial", sans-serif;
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

.error-message {
  color: #ff4757;
  margin-top: 10px;
}

.form-select {
  padding: 10px;
  border-radius: 8px;
  border: 1px solid #ddd;
  font-size: 14px;
  width: 100%;
  color: #333;
}
</style>

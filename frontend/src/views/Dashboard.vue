<script>
import HeaderComponent from '@/components/HeaderComponent.vue';
import { useUserStore } from "../stores/userStore";
import { storeToRefs } from "pinia";
import { getGameHistory } from "../services/httpClient";
import { ref } from 'vue';

export default {
  name: "Dashboard",
  setup() {
    const userStore = useUserStore();
    const { user, error, loading } = storeToRefs(userStore);
    const gamesCount = ref(0);

    const fetchGamesCount = async () => {
      try {
        if (user.value?.id) {
          const response = await getGameHistory(user.value.id);
          const games = response.Game;
          gamesCount.value = games.length;
        }
      } catch (error) {
        console.error("Erreur lors de la récupération des parties:", error);
      }
    };

    return {
      user,
      error,
      loading,
      gamesCount,
      fetchGamesCount,
      fetchUser: userStore.fetchUser,
      handleLogout: () => {
        userStore.logout();
        window.location.reload();
      },
    };
  },

  async mounted() {
    if (!this.user) {
      await this.fetchUser();
    }
    await this.fetchGamesCount();
  },

  methods: {
    navigateToCreateGame() {
      this.$router.push("/createGame");
    },

    handleLogin() {
      this.$router.push("/login");
    },

    handleRegister() {
      this.$router.push("/register");
    },

    handleHistory(){
      this.$router.push("/history")
    }
  },

  components: {
    HeaderComponent,
  },
};
</script>

<template>
  <div class="app-container">
    <HeaderComponent
      v-if="user"
      :user="user"
      @createGame="navigateToCreateGame"
      @logout="handleLogout"
      @register="handleRegister"
      @login="handleLogin"
    />

    <main class="main-content">
      <div class="login-card">
        <div v-if="loading" class="loading">Chargement...</div>
        <h1 class="login-title">Tableau de Bord</h1>
        <p v-if="error" class="error-message">{{ error }}</p>

        <div class="stats-container">
          <div class="stat-item">
            <h2>Nombre de parties jouées</h2>
            <p class="stat-value">{{ gamesCount }}</p>
          </div>
        </div>

        <button @click="handleHistory">Historique des parties</button>
      </div>
    </main>
  </div>
</template>

<style scoped>

.app-container {
  font-family: 'Arial', sans-serif;
  min-height: 100vh;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  padding: clamp(10px, 2vw, 20px);
}


.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: clamp(10px, 3vw, 15px) clamp(15px, 5%, 5%);
  background-color: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  border-radius: clamp(8px, 2vw, 16px);
  margin-bottom: clamp(10px, 3vw, 20px);
}

.navbar-brand {
  color: white;
  font-size: clamp(18px, 4vw, 24px);
  font-weight: 700;
}

.navbar-menu {
  display: flex;
  align-items: center;
  gap: clamp(10px, 2vw, 15px);
  flex-wrap: wrap;
}

.navbar-user, .navbar-auth {
  display: flex;
  align-items: center;
  gap: clamp(8px, 2vw, 15px);
  flex-wrap: wrap;
}

.navbar-user span {
  color: white;
  margin-right: clamp(8px, 2vw, 15px);
  font-size: clamp(14px, 3vw, 16px);
}

.nav-button {
  background: linear-gradient(to right, #667eea, #764ba2);
  color: white;
  border: none;
  padding: clamp(8px, 2vw, 10px) clamp(12px, 3vw, 15px);
  border-radius: clamp(6px, 1.5vw, 8px);
  font-size: clamp(12px, 2.5vw, 14px);
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s ease;
  white-space: nowrap;
}

.nav-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 7px 14px rgba(0, 0, 0, 0.1);
}

.create-game-button {
  background: linear-gradient(to right, #48bb78, #38b2ac);
}

.logout-button {
  background: linear-gradient(to right, #f56565, #ed64a6);
}

/* Main content styles */
.main-content {
  display: flex;
  justify-content: center;
  align-items: flex-start;
  padding-top: clamp(20px, 5vw, 50px);
}

.login-card {
  background-color: white;
  border-radius: clamp(12px, 3vw, 16px);
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
  padding: clamp(20px, 5vw, 40px);
  width: clamp(280px, 90%, 500px);
  text-align: center;
  margin: auto;
}

.loading {
  color: #667eea;
  font-size: clamp(16px, 3vw, 20px);
  margin: clamp(10px, 2vw, 20px) 0;
}

.login-title {
  color: #333;
  margin-bottom: clamp(15px, 4vw, 20px);
  font-size: clamp(20px, 5vw, 24px);
  font-weight: 700;
}

.error-message {
  color: #ff4757;
  margin-top: clamp(10px, 3vw, 20px);
  font-size: clamp(14px, 2.5vw, 16px);
}

/* Stats container styles */
.stats-container {
  margin: clamp(15px, 4vw, 30px) 0;
  padding: clamp(15px, 3vw, 20px);
  background-color: rgba(102, 126, 234, 0.1);
  border-radius: clamp(8px, 2vw, 12px);
  transition: all 0.3s ease;
}

.stats-container:hover {
  transform: translateY(-2px);
  box-shadow: 0 5px 15px rgba(102, 126, 234, 0.2);
}

.stat-item {
  text-align: center;
}

.stat-item h2 {
  color: #4a5568;
  font-size: clamp(16px, 3vw, 1.2rem);
  margin-bottom: clamp(8px, 2vw, 10px);
}

.stat-value {
  color: #667eea;
  font-size: clamp(24px, 6vw, 2.5rem);
  font-weight: bold;
  text-shadow: 0 2px 4px rgba(102, 126, 234, 0.2);
}

/* Button styles */
.login-card button {
  background: linear-gradient(to right, #ffd700, #ffa500);
  color: white;
  border: none;
  padding: clamp(10px, 2vw, 12px) clamp(16px, 4vw, 24px);
  border-radius: clamp(6px, 1.5vw, 8px);
  font-size: clamp(14px, 2.5vw, 16px);
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s ease;
  margin-top: clamp(15px, 3vw, 20px);
  width: clamp(200px, 80%, 300px);
}

.login-card button:hover {
  transform: translateY(-2px);
  box-shadow: 0 7px 14px rgba(255, 215, 0, 0.2);
}

/* Specific responsive adjustments */
@media screen and (max-width: 768px) {
  .navbar {
    flex-direction: column;
    gap: 10px;
  }

  .navbar-menu {
    width: 100%;
    justify-content: center;
  }

  .navbar-user, .navbar-auth {
    justify-content: center;
    width: 100%;
  }

  .main-content {
    padding-top: 10px;
  }
}

@media screen and (max-width: 480px) {
  .login-card {
    padding: 15px;
    margin: 10px;
  }

  .navbar-user-image {
    width: 50px;
    height: 50px;
  }

  .nav-button {
    padding: 8px 12px;
    font-size: 12px;
  }
}

@media screen and (max-width: 320px) {
  .login-card {
    padding: 10px;
    margin: 5px;
  }

  .stats-container {
    padding: 10px;
  }

  .nav-button {
    padding: 6px 10px;
    font-size: 11px;
  }
}

@media screen and (min-width: 1200px) {
  .login-card {
    max-width: 600px;
  }

  .stats-container {
    padding: 30px;
  }
}

/* Animations */
@keyframes fadeIn {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}

.login-card {
  animation: fadeIn 0.5s ease-out;
}

.stats-container {
  animation: fadeIn 0.5s ease-out 0.2s both;
}
</style>

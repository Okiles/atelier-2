<script>
import { getUserIdentity, removeToken } from '../services/authProvider';

export default {
  name: 'Dashboard',
  data() {
    return {
      user: null,
      error: null,
    };
  },
  methods: {
    async handleLogout() {
      removeToken();
      this.$router.push('/login');
    },

    async handleLogin() {
      this.$router.push('/login');
    },

    async handleRegister() {
      this.$router.push('/register');
    },

    async navigateToCreateGame() {
      this.$router.push('/createGame');
    },
  },
  async mounted() {
    this.user = getUserIdentity();
  }
}
</script>

<template>
  <div class="app-container">
    <nav class="navbar">
      <div class="navbar-brand">GeoQuizz</div>
      <div class="navbar-menu">
        <div v-if="user" class="navbar-user">
          <span>{{ user.username }}</span>
          <button @click="navigateToCreateGame" class="nav-button create-game-button">
            Créer une partie
          </button>
          <button @click="handleLogout" class="nav-button logout-button">
            Se déconnecter
          </button>
        </div>
        <div v-else class="navbar-auth">
          <button @click="handleRegister" class="nav-button register-button">
            S'inscrire
          </button>
          <button @click="handleLogin" class="nav-button login-button">
            Se connecter
          </button>
        </div>
      </div>
    </nav>

    <main class="main-content">
      <div class="login-card">
        <h1 class="login-title">Tableau de Bord</h1>
        <p v-if="error" class="error-message">{{ error }}</p>
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
}

.navbar-menu {
  display: flex;
  align-items: center;
}

.navbar-user, .navbar-auth {
  display: flex;
  align-items: center;
  gap: 15px;
}

.navbar-user span {
  color: white;
  margin-right: 15px;
}

.nav-button {
  background: linear-gradient(to right, #667eea, #764ba2);
  color: white;
  border: none;
  padding: 10px 15px;
  border-radius: 8px;
  font-size: 14px;
  font-weight: 600;
  cursor: pointer;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
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

.login-title {
  color: #333;
  margin-bottom: 20px;
  font-size: 24px;
  font-weight: 700;
}

.error-message {
  color: #ff4757;
  margin-top: 20px;
}
</style>

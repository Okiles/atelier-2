<script>
import HeaderComponent from '@/components/HeaderComponent.vue';
import { getUserIdentity, removeToken } from '../services/authProvider';
import { getUser } from '../services/httpClient';

export default {
  name: 'Dashboard',
  data() {
    return {
      user: null,
      error: null,
    };
  },
  methods: {
    async fetchUser() {
      try {
        const response = await getUser();
        console.log(response);
        this.user = response;
      } catch (error) {
        this.error = error.message;
        console.error('Error fetching user:', error);
      }
    },

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
    const userIdentity = getUserIdentity();
    if (userIdentity) {
      this.user = userIdentity;
      await this.fetchUser();
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
    :user="user"
    @createGame="navigateToCreateGame"
    @logout="handleLogout"
    @register="handleRegister"
    @login="handleLogin"
  />


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

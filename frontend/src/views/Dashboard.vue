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
  },
  async mounted() {
    this.user = getUserIdentity();
    if(!this.user){
      this.$router.push('/login');
    }
  }
}
</script>

<template>
  <div class="dashboard">
    <h1>Bienvenue sur le Dashboard</h1>
    <div v-if="user">
      <p>Connecté en tant que : <strong>{{ user.username }}</strong></p>
      <button @click="logout" class="logout-button">Se déconnecter</button>
    </div>

    <p v-if="error" class="error">{{ error }}</p>
  </div>
</template>


<style scoped>
</style>

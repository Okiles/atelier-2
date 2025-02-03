<script>
import { setToken } from '../services/authProvider';
import { login } from '../services/httpClient';

export default {
  name: 'Login',
  data() {
    return {
      email : '',
      password: '',
      error: null,
    };
  },
  methods: {
    async handleLogin() {
      try {
        const response = await login(this.email, this.password);
        setToken(response.token);
        this.$router.push('/dashboard');
      } catch (err) {
        this.error = err.message || 'Une erreur est survenue.';
      }
    },
  },
};
</script>


<template>
  <div id="login-container">
    <h1>Connexion</h1>
    <form @submit.prevent="handleLogin">
      <div>
        <label for="email">email :</label>
        <input
          type="text"
          id="email"
          v-model="email"
          placeholder="Entrez votre email"
        />
      </div>
      <div>
        <label for="password">Mot de passe :</label>
        <input
          type="password"
          id="password"
          v-model="password"
          placeholder="Entrez votre mot de passe"
        />
      </div>
      <button type="submit">Se connecter</button>
    </form>
    <p v-if="error" class="error">{{ error }}</p>
    <p>
      Pas encore de compte ? <router-link to="/register">Inscrivez-vous</router-link>
    </p>
  </div>
</template>


<style>

</style>

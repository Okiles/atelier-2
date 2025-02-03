<script>
import { register } from '../services/httpClient';

export default {
  name: 'Register',
  data() {
    return {
      username: '',
      email: '',
      password: '',
      confirmPassword: '',
      error: null,
    };
  },
  methods: {
    async handleRegister() {
      if (this.password !== this.confirmPassword) {
        this.error = 'Les mots de passe ne correspondent pas.';
        return;
      }

      try {
        await register(this.username,this.email, this.password);
        this.$router.push('/login');
      } catch (err) {
        this.error = err.message || 'Une erreur est survenue.';
      }
    },
  },
};
</script>

<template>
  <div class="register-container">
    <h1>Inscription</h1>
    <form @submit.prevent="handleRegister">
      <div>
        <label for="username">Nom d'utilisateur :</label>
        <input
          type="text"
          id="username"
          v-model="username"
          placeholder="Entrez votre nom d'utilisateur"
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
      <div>
        <label for="confirmPassword">Confirmer le mot de passe :</label>
        <input
          type="password"
          id="confirmPassword"
          v-model="confirmPassword"
          placeholder="Confirmez votre mot de passe"
        />
      </div>
      <button type="submit">S'inscrire</button>
    </form>
    <p v-if="error" class="error">{{ error }}</p>
    <p>
      Déjà inscrit ? <router-link to="/login">Connectez-vous</router-link>
    </p>
  </div>
</template>

<style>

</style>




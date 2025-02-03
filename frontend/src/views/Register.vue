<script>
import { register } from '../services/httpClient';

export default {
  name: 'Register',
  data() {
    return {
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
        await register(this.email, this.password);
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
        <label for="email">Email :</label>
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




<script>
import { setToken } from '../services/authProvider';
import { login } from '../services/httpClient';

export default {
  name: 'Login',
  data() {
    return {
      email: '',
      password: '',
      error: null,
    };
  },
  methods: {
    async handleLogin() {
      try {
        const response = await login(this.email, this.password);
        setToken(response.token);
        this.$router.push('/');
      } catch (err) {
        this.error = 'Email ou mot de passe incorrect.';
      }
    },
  },
};
</script>

<template>
  <div class="login-container">
    <div class="login-card">
      <h1 class="login-title">Connexion</h1>
      <form @submit.prevent="handleLogin" class="login-form">
        <div class="form-group">
          <label for="email" class="form-label">Email</label>
          <input
            type="text"
            id="email"
            v-model="email"
            placeholder="Entrez votre email"
            class="form-input"
          />
        </div>
        <div class="form-group">
          <label for="password" class="form-label">Mot de passe</label>
          <input
            type="password"
            id="password"
            v-model="password"
            placeholder="Entrez votre mot de passe"
            class="form-input"
          />
        </div>
        <button type="submit" class="login-button">Se connecter</button>

        <p v-if="error" class="error-message">{{ error }}</p>

        <p class="register-link">
          Pas encore de compte ?
          <router-link to="/register" class="register-text">Inscrivez-vous</router-link>
        </p>
      </form>
    </div>
  </div>
</template>

<style scoped>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  font-family: 'Arial', sans-serif;
}

.login-card {
  background-color: white;
  border-radius: 16px;
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
  padding: 40px;
  width: 100%;
  max-width: 400px;
  transition: transform 0.3s ease;
}

.login-card:hover {
  transform: scale(1.02);
}

.login-title {
  text-align: center;
  color: #333;
  margin-bottom: 30px;
  font-size: 24px;
  font-weight: 700;
}

.login-form {
  display: flex;
  flex-direction: column;
}

.form-group {
  margin-bottom: 20px;
}

.form-label {
  display: block;
  margin-bottom: 8px;
  color: #666;
  font-weight: 600;
}

.form-input {
  width: 100%;
  padding: 12px 15px;
  border: 2px solid #e0e0e0;
  border-radius: 8px;
  font-size: 16px;
  transition: border-color 0.3s ease;
  box-sizing: border-box;
}

.form-input:focus {
  outline: none;
  border-color: #667eea;
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

.login-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 7px 14px rgba(0, 0, 0, 0.1);
}

.error-message {
  color: #ff4757;
  text-align: center;
  margin-top: 15px;
}

.register-link {
  text-align: center;
  margin-top: 20px;
  color: #666;
}

.register-text {
  color: #667eea;
  text-decoration: none;
  font-weight: 600;
  transition: color 0.3s ease;
}

.register-text:hover {
  color: #764ba2;
}
</style>

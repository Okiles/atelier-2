<template>
  <!-- Navbar lorsque l'utilisateur est connecté -->
  <nav v-if="user" class="navbar">
    <div class="navbar-user-info">
      <!-- Afficher l'image de profil si elle existe, sinon une image par défaut -->
      <img :src="user.profile_picture ? 'http://localhost:42055' + user.profile_picture : defaultImage" alt="Photo de profil" class="navbar-user-image">
      <!-- Afficher le nom d'utilisateur ou 'Anonyme' si non défini -->
      <span class="navbar-username">Bienvenue, {{ user.username || 'Utilisateur' }}</span>
    </div>
    <div class="navbar-brand-wrapper">
      <h1 class="navbar-brand">GeoQuizz</h1>
    </div>
    <div class="navbar-menu">
      <button @click="$emit('createGame')" class="nav-button create-game-button">
        Créer une partie
      </button>
      <button @click="handleLogout" class="nav-button logout-button">
        Se déconnecter
      </button>
    </div>
  </nav>

  <!-- Navbar lorsque l'utilisateur n'est pas connecté -->
  <nav v-else class="navbar">
    <div class="navbar-user-info">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBsdZ-yU8qdxr0WrIA8HLa31tB_cCFZJt-2Q&s" alt="Photo de profil" class="navbar-user-image">
      <span>Anonyme</span>
    </div>
    <div class="navbar-brand-wrapper">
      <h1 class="navbar-brand">GeoQuizz</h1>
    </div>
    <div class="navbar-menu">
      <button @click="$emit('login')" class="nav-button">
        Se connecter
      </button>
      <button @click="$emit('register')" class="nav-button">
        S'inscrire
      </button>
    </div>
  </nav>
</template>

<script>
import { useUserStore } from "../stores/userStore";
import { storeToRefs } from "pinia";
import { onMounted } from "vue";  // Importer onMounted pour appeler fetchUser

export default {
  name: 'HeaderComponent',

  setup() {
    const userStore = useUserStore();
    const { user } = storeToRefs(userStore);
    const defaultImage = 'https://www.example.com/default-image.jpg'; // Image par défaut

    const handleLogout = () => {
      userStore.logout();
    };

    // Appeler fetchUser lors du montage du composant
    onMounted(() => {
      userStore.fetchUser();  // Appel de la méthode fetchUser pour récupérer les données utilisateur
    });

    return {
      user,
      defaultImage,
      handleLogout,
    };
  },
};
</script>

<style scoped>
/* Style déjà défini comme précédemment */
</style>


<style scoped>
.navbar {
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 10px;
  background-color: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  width: 100%;
  box-sizing: border-box;
}

.navbar-brand-wrapper, .navbar-user-info, .navbar-menu {
  flex: 1;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 10px;
}

.navbar-brand-wrapper {
  text-align: center;
}

.navbar-brand {
  color: white;
  font-size: 24px;
  font-weight: 700;
  text-align: center;
}

.navbar-user-info {
  display: flex;
  align-items: center;
  gap: 10px;
  color: white;
}

.navbar-username {
  font-size: 18px;
}

.navbar-user-image {
  width: 50px;
  height: 50px;
  border-radius: 50%;
}

.navbar-menu {
  display: flex;
  align-items: flex-end;
  gap: 15px;
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

.logout-button {
  background: linear-gradient(to right, #f56565, #ed64a6);
}

.create-game-button {
  background: linear-gradient(to right, #48bb78, #38b2ac);
}
</style>

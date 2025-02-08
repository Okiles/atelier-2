<template>
  <div class="profile-container">
    <div class="profile-card">
      <img :src="user.profile_picture ? 'http://docketu.iutnc.univ-lorraine.fr:42055' + user.profile_picture : defaultImage"
           alt="Profile Picture" class="profile-picture" />

      <div class="profile-info">
        <div class="input-group">
          <label for="username">Nom d'utilisateur</label>
          <input type="text" id="username" :value="user.username" disabled />
        </div>

        <div class="input-group">
          <label for="name">Prénom</label>
          <input type="text" id="name" :value="user.name" disabled />
        </div>

        <div class="input-group">
          <label for="lastname">Nom</label>
          <input type="text" id="lastname" :value="user.lastname" disabled />
        </div>

        <div class="input-group">
          <label for="email">Email</label>
          <input type="email" id="email" :value="user.email" disabled />
        </div>
      </div>

      <router-link to="/profile/edit" class="edit-button">Éditer le profil</router-link>
    </div>
  </div>
</template>

<script>
import { useUserStore } from "../stores/userStore";
import { storeToRefs } from "pinia";
import { onMounted } from "vue";

export default {
  name: "Profile",

  setup() {
    const userStore = useUserStore();
    const { user } = storeToRefs(userStore);
    const defaultImage = 'https://www.example.com/default-image.jpg';

    onMounted(() => {
      userStore.fetchUser(); // Récupère les données utilisateur lors du chargement du profil
    });

    return {
      user,
      defaultImage
    };
  }
};
</script>

<style scoped>
.profile-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.profile-card {
  background: white;
  padding: 25px;
  border-radius: 12px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
  text-align: center;
  max-width: 420px;
  width: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.profile-picture {
  width: 120px;
  height: 120px;
  border-radius: 50%;
  object-fit: cover;
  border: 4px solid #007bff;
}

.profile-info {
  width: 100%;
}

.input-group {
  text-align: left;
  margin-bottom: 12px;
}

label {
  display: block;
  font-weight: bold;
  margin-bottom: 5px;
  color: #333;
}

input {
  width: 100%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 6px;
  background-color: #f9f9f9;
  cursor: not-allowed;
  box-sizing: border-box;
}

.edit-button {
  display: inline-block;
  margin-top: 15px;
  padding: 12px 18px;
  background-color: #007bff;
  color: white;
  text-decoration: none;
  border-radius: 6px;
  font-weight: bold;
  transition: transform 0.2s ease-in-out, background 0.3s ease-in-out;
}

.edit-button:hover {
  background-color: #0056b3;
  transform: scale(1.05);
}
</style>

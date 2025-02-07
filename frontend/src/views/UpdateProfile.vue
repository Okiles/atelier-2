<template>
  <div class="profile-edit-container">
    <div class="profile-edit-card">
      <h2>Modifier votre profil</h2>
      <form @submit.prevent="updateProfile" class="profile-edit-form">

        <div class="input-group">
          <label for="firstName">Prénom</label>
          <input type="text" id="firstName" v-model="form.firstName" />
        </div>

        <div class="input-group">
          <label for="lastName">Nom</label>
          <input type="text" id="lastName" v-model="form.lastName" />
        </div>

        <div class="input-group">
          <label for="username">Nom d'utilisateur</label>
          <input type="text" id="username" v-model="form.username" />
        </div>

        <div class="input-group">
          <label for="currentPassword">Ancien mot de passe</label>
          <input type="password" id="currentPassword" v-model="form.currentPassword" />
        </div>

        <div class="input-group">
          <label for="newPassword">Nouveau mot de passe</label>
          <input type="password" id="newPassword" v-model="form.newPassword" />
        </div>

        <div class="input-group">
          <label for="profilePicture">Photo de profil</label>
          <input type="file" id="profilePicture" @change="handleFileChange" />
          <img v-if="previewImage" :src="previewImage" alt="Prévisualisation" class="profile-preview" />
        </div>

        <button type="submit" class="submit-button">Mettre à jour</button>
      </form>
    </div>
  </div>
</template>

<script>
import { updateUser } from '@/services/httpClient.js';

export default {
  name: 'UpdateProfile',
  data() {
    return {
      form: {
        firstName: '',
        lastName: '',
        username: '',
        currentPassword: '',
        newPassword: '',
        profilePicture: null,
      },
      previewImage: null,
    };
  },
  methods: {
    handleFileChange(event) {
      const file = event.target.files[0];
      if (file) {
        this.form.profilePicture = file;
        this.previewImage = URL.createObjectURL(file);
      }
    },
    updateProfile() {
      try {
        const formData = new FormData();
        formData.append('firstName', this.form.firstName);
        formData.append('lastName', this.form.lastName);
        formData.append('username', this.form.username);
        formData.append('currentPassword', this.form.currentPassword);
        formData.append('newPassword', this.form.newPassword);
        if (this.form.profilePicture) {
          formData.append('profilePicture', this.form.profilePicture);
        }

        updateUser(formData)
          .then(() => {
            alert('Profil mis à jour avec succès');
          })
          .catch((error) => {
            console.error(error);
            alert('Une erreur est survenue lors de la mise à jour du profil');
          });
      } catch (error) {
        console.error(error);
        alert('Une erreur est survenue lors de la mise à jour du profil');
      }
    },
  },
};
</script>

<style scoped>
.profile-edit-container {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  background: linear-gradient(to right, #6a11cb, #2575fc);
}

.profile-edit-card {
  background: white;
  padding: 25px;
  border-radius: 12px;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
  text-align: center;
  max-width: 420px;
  width: 100%;
}

h2 {
  color: #333;
  font-size: 22px;
  margin-bottom: 20px;
}

.input-group {
  text-align: left;
  margin-bottom: 15px;
}

label {
  display: block;
  font-weight: bold;
  margin-bottom: 5px;
  color: #333;
}

input {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 6px;
  background-color: #f9f9f9;
  transition: border 0.3s ease-in-out;
  box-sizing: border-box;
}

input:focus {
  border-color: #007bff;
  outline: none;
}

.profile-preview {
  width: 100px;
  height: 100px;
  border-radius: 50%;
  object-fit: cover;
  margin-top: 10px;
  border: 2px solid #007bff;
}

.submit-button {
  width: 100%;
  padding: 12px;
  background: linear-gradient(to right, #667eea, #764ba2);
  color: white;
  border: none;
  border-radius: 8px;
  font-size: 16px;
  font-weight: bold;
  cursor: pointer;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.submit-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 7px 14px rgba(0, 0, 0, 0.1);
  background: linear-gradient(to right, #5a67d8, #6b46c1);
}
</style>

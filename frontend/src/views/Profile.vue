<template>
  <div class="profile-edit-container">
    <h2>Modifier votre profil</h2>
    <form @submit.prevent="updateProfile" class="profile-edit-form">
      <div class="form-group">
        <label for="firstName">Prénom</label>
        <input type="text" id="firstName" v-model="form.firstName" >
      </div>
      <div class="form-group">
        <label for="lastName">Nom</label>
        <input type="text" id="lastName" v-model="form.lastName" >
      </div>
      <div class="form-group">
        <label for="username">Nom d'utilisateur</label>
        <input type="text" id="username" v-model="form.username">
      </div>
      <div class="form-group">
        <label for="currentPassword">Ancien mot de passe</label>
        <input type="password" id="currentPassword" v-model="form.currentPassword" >
      </div>
      <div class="form-group">
        <label for="newPassword">Nouveau mot de passe</label>
        <input type="password" id="newPassword" v-model="form.newPassword" >
      </div>
      <div class="form-group">
        <label for="profilePicture">Photo de profil</label>
        <input type="file" id="profilePicture" @change="handleFileChange">
        <img v-if="previewImage" :src="previewImage" alt="Prévisualisation" class="profile-preview">
      </div>
      <button type="submit" class="submit-button">Mettre à jour</button>
    </form>
  </div>
</template>

<script>
import { updateUser } from '@/services/httpClient.js';
export default {
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

     // Pass formData to the updateUser function
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
  max-width: 600px;
  margin: 20px auto;
  padding: 20px;
  background-color: #f9f9f9;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

h2 {
  text-align: center;
  color: #333;
}

.profile-edit-form .form-group {
  margin-bottom: 15px;
}

.profile-edit-form label {
  display: block;
  font-size: 14px;
  color: #333;
}

.profile-edit-form input[type="text"],
.profile-edit-form input[type="password"],
.profile-edit-form input[type="file"] {
  width: 100%;
  padding: 10px;
  margin-top: 5px;
  border-radius: 5px;
  border: 1px solid #ccc;
}

.profile-preview {
  width: 100px;
  height: 100px;
  object-fit: cover;
  margin-top: 10px;
}

.submit-button {
  width: 100%;
  padding: 10px;
  background-color: #48bb78;
  color: white;
  border: none;
  border-radius: 8px;
  font-size: 16px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.submit-button:hover {
  background-color: #38b2ac;
}
</style>

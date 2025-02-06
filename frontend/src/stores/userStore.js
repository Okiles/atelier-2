// userStore.js
import { defineStore } from "pinia";
import { getUserIdentity, removeToken } from "../services/authProvider";
import { getUser } from "../services/httpClient";

export const useUserStore = defineStore("user", {
  state: () => ({
    user: getUserIdentity() || null,
    error: null,
    loading: false
  }),

  actions: {
    async fetchUser() {
      this.loading = true;
      try {
        const response = await getUser();
        this.user = {
          ...getUserIdentity(),
          ...response
        };
      } catch (error) {
        this.error = error.message;
        console.error("Erreur lors de la récupération de l'utilisateur :", error);
      } finally {
        this.loading = false;
      }
    },

    logout() {
      removeToken();
      this.user = null;
      this.error = null;
    },
  },
});

import { defineStore } from "pinia";
import { getUserIdentity, removeToken } from "../services/authProvider";
import { getUser } from "../services/httpClient";

export const useUserStore = defineStore("user", {
  state: () => ({
    user: getUserIdentity() || null,
    error: null,
  }),

  actions: {
    async fetchUser() {
      try {
        const response = await getUser();
        this.user = response;
      } catch (error) {
        this.error = error.message;
        console.error("Erreur lors de la récupération de l'utilisateur :", error);
      }
    },

    logout() {
      removeToken();
      this.user = null;
    },
  },
});

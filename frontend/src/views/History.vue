<script>
import { getGameHistory } from "../services/httpClient";
import { useUserStore} from "../stores/userStore.js";

export default {
  name: "History",
  data() {
    return {
      games: [],
      error: null,
    };
  },

  async mounted() {
    try {
      const userStore = useUserStore();


      if (!userStore.user || !userStore.user.id) {
        this.error = "Utilisateur non authentifié.";
        return;
      }

      // Appel API pour récupérer l'historique des parties
      const history = await getGameHistory(userStore.user.id);
      this.games = history;
    } catch (err) {
      this.error =
        err.message || "Une erreur s'est produite lors de la récupération de l'historique.";
    }
  },
};
</script>

<template>
  <div class="history">
    <h1>Historique des Parties</h1>

    <div v-if="error" class="error">
      <p>Erreur : {{ error }}</p>
    </div>

    <div v-else>
      <ul v-if="games.length">
        <li v-for="game in games" :key="game.id">
          <p>Partie ID: {{ game.id }}</p>
          <p>Score: {{ game.score }}</p>
          <p>Durée: {{ game.duree }} minutes</p>
          <p>Distance: {{ game.distance }} km</p>
          <p>Statut: {{ game.status }}</p>
          <hr />
        </li>
      </ul>

      <p v-else>Aucune partie trouvée.</p>
    </div>
  </div>
</template>

<style scoped>

</style>

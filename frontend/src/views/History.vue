<script>
import { getGameHistory } from "../services/httpClient";
import { useUserStore } from "../stores/userStore.js";

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


      const history = await getGameHistory(userStore.user.id);
      console.log(history);


      this.games = history.Game.reverse() || [];
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
        <li v-for="game in games" :key="game.ID">
          <p>Partie ID: {{ game.ID }}</p>
          <p>Score: {{ game.Score }}</p>
          <p>Durée de manche: <strong>{{ game.Duree }}</strong> secondes</p>
          <p>Distance de difficulté: <strong>{{ game.Distance }}</strong> mètres</p>
          <p>Statut: {{ game.Status }}</p>
          <hr />
        </li>
      </ul>

      <p v-else>Aucune partie trouvée.</p>
    </div>
  </div>
</template>

<style scoped>
.history {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  min-height: 100vh;
  color: white;
}

.history h1 {
  font-size: 32px;
  font-weight: 700;
  text-align: center;
  margin-bottom: 30px;
  color: white;
}

.error {
  background-color: rgba(255, 99, 71, 0.1);
  backdrop-filter: blur(10px);
  padding: 20px;
  border-radius: 16px;
  margin: 20px 0;
  border: 2px solid rgba(255, 99, 71, 0.3);
}

.error p {
  color: white;
  font-size: 18px;
  margin: 0;
  text-align: center;
}

ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

li {
  background-color: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  padding: 25px;
  border-radius: 16px;
  margin-bottom: 20px;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
}

li:hover {
  transform: translateY(-2px);
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
}

li p {
  margin: 10px 0;
  font-size: 18px;
  color: white;
}

hr {
  border: none;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  margin: 15px 0;
}


.history > div > p {
  text-align: center;
  font-size: 20px;
  color: white;
  background-color: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  padding: 30px;
  border-radius: 16px;
  margin-top: 40px;
}


li p:nth-child(1) {
  font-weight: 700;
  font-size: 20px;
  color: #ffd700;
}

li p:nth-child(2) {
  font-size: 24px;
  font-weight: 600;
  color: #48bb78;
}

li p:nth-child(3),
li p:nth-child(4) {
  color: rgba(255, 255, 255, 0.9);
}

li p:nth-child(5) {
  font-weight: 600;
  padding: 5px 10px;
  border-radius: 8px;
  display: inline-block;
  background: linear-gradient(to right, #48bb78, #38b2ac);
}


@media (max-width: 768px) {
  .history {
    padding: 15px;
  }

  li {
    padding: 20px;
  }

  .history h1 {
    font-size: 28px;
  }

  li p {
    font-size: 16px;
  }
}
</style>

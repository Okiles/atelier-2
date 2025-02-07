<script>
import { ref, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import StartGame from './StartGame.vue';
import Game from './Game.vue';
import FinishGame from './FinishGame.vue';
import { getGameState } from "../services/httpClient.js";
import { getGameIdentity } from "@/services/authProvider.js";

export default {
  name: "GameContainer",
  components: {
    StartGame,
    Game,
    FinishGame
  },
  setup() {
    const currentState = ref('start');
    const finalScore = ref(0);
    const gameData = ref(null);
    const gameState = ref(null);
    const router = useRouter();
    const isLoading = ref(true);

    const initGame = async () => {
      try {
        const identity = getGameIdentity();
        if (!identity?.game_id) {
          throw new Error("No game identity found");
        }

        gameData.value = identity;
        const state = await getGameState(identity.game_id);
        gameState.value = state;
      } catch (error) {
        console.error("Error initializing game:", error);
      } finally {
        isLoading.value = false;
      }
    };

    const startGame = () => {
      if (gameState.value) {
        currentState.value = 'game';
      }
    };

    const handleGameFinished = (score) => {
      finalScore.value = score;
      currentState.value = 'finish';
    };

    const returnHome = () => {
      router.push("/");
    };

    onMounted(async () => {
      await initGame();
    });

    return {
      currentState,
      finalScore,
      gameState,
      startGame,
      handleGameFinished,
      returnHome,
      isLoading
    };
  }
};
</script>

<template>
  <div class="game-container">
    <div v-if="isLoading" class="loading">
      Chargement...
    </div>
    <template v-else>
      <StartGame
        v-if="currentState === 'start'"
        @start-game="startGame"
      />

      <Game
        v-if="currentState === 'game' && gameState"
        :initial-game-state="gameState"
        @game-finished="handleGameFinished"
      />

      <FinishGame
        v-if="currentState === 'finish'"
        :final-score="finalScore"
        @return-home="returnHome"
      />
    </template>
  </div>
</template>

<style>
.game-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
  text-align: center;
  position: relative;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  min-height: 100vh;
}

.loading {
  color: white;
  font-size: 1.5rem;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}
</style>

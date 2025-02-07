<script>
export default {
  name: "FinishGame",
  props: {
    finalScore: {
      type: Number,
      required: true
    }
  },
  emits: ['return-home']
}
</script>

<template>
  <div class="end-screen">
    <h2>Partie terminée !</h2>
    <div class="final-score">
      <span class="score-label">Score final</span>
      <span class="score-value">{{ finalScore }}</span>
    </div>
    <button @click="$emit('return-home')" class="game-button return-button">
      Retour à l'accueil
    </button>
  </div>
</template>

<style scoped>
.end-screen {
  max-width: 600px;
  margin: 100px auto;
  padding: 40px;
  background-color: rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
  border-radius: 16px;
  text-align: center;
  color: white;
}

h2 {
  font-size: 2.5rem;
  margin-bottom: 30px;
  color: white;
  text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.final-score {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 40px 0;
  padding: 20px;
  background: rgba(255, 255, 255, 0.15);
  border-radius: 12px;
}

.score-label {
  font-size: 1.5rem;
  margin-bottom: 15px;
  text-transform: uppercase;
  letter-spacing: 2px;
}

.score-value {
  font-size: 4rem;
  font-weight: bold;
  color: #ffd700;
  text-shadow: 0 0 10px rgba(255, 215, 0, 0.5);
}

.game-button {
  background: linear-gradient(to right, #667eea, #764ba2);
  color: white;
  border: none;
  padding: 15px 40px;
  border-radius: 8px;
  font-size: 1.2rem;
  font-weight: 600;
  cursor: pointer;
  transition: transform 0.2s ease, box-shadow 0.2s ease;
  text-transform: uppercase;
  letter-spacing: 1px;
}

.game-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 7px 14px rgba(0, 0, 0, 0.1);
}

.return-button {
  background: linear-gradient(to right, #48bb78, #38b2ac);
}

@media (max-width: 768px) {
  .end-screen {
    margin: 50px 20px;
    padding: 30px;
  }

  h2 {
    font-size: 2rem;
  }

  .score-value {
    font-size: 3rem;
  }

  .game-button {
    padding: 12px 30px;
    font-size: 1rem;
  }
}
</style>

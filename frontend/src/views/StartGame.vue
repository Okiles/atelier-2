<script>
export default {
  name: "StartGame",
  emits: ['start-game'],
}
</script>

<template>
  <div class="start-screen">
    <h2>Bienvenue sur GeoQuizz</h2>
    <p>Êtes-vous prêt à tester vos connaissances géographiques ?</p>
    <button @click="$emit('start-game')" class="game-button start-button">
      Démarrer la partie
    </button>
  </div>
</template>

<style scoped>
.start-screen {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100vh;
}

.start-screen h2 {
  font-size: 2rem;
  color: white;
  margin-bottom: 20px;
}

.start-screen p {
  color: white;
  margin-bottom: 40px;
}

.start-button {
  background: linear-gradient(to right, #667eea, #764ba2);
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 1rem;
}
</style>

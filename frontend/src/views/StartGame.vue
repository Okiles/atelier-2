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
</style>

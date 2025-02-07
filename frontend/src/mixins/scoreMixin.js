export default {
  methods: {
    calculateScore(actualCoords, guessedCoords, timeTaken, difficulty) {
      const distance = this.getDistance(actualCoords, guessedCoords);


      let baseScore = 0;
      if (distance <= difficulty) {
        baseScore = 1000 * (1 - distance/difficulty);
      }

      // Calcul du bonus temps
      const timeBonus = 500 * Math.max(0, Math.min(1, (30 - timeTaken)/(30 - 2)));

      return Math.round(baseScore + timeBonus);
    },
    getDistance([lat1, lon1], [lat2, lon2]) {
      const R = 6371;
      const dLat = (lat2 - lat1) * (Math.PI / 180);
      const dLon = (lon2 - lon1) * (Math.PI / 180);
      const a =
        Math.sin(dLat / 2) * Math.sin(dLat / 2) +
        Math.cos(lat1 * (Math.PI / 180)) *
        Math.cos(lat2 * (Math.PI / 180)) *
        Math.sin(dLon / 2) *
        Math.sin(dLon / 2);
      const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
      return R * c;
    },
  },
};

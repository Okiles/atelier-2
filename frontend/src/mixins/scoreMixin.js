export default {
  methods: {
    calculateScore(actualCoords, guessedCoords, timeTaken, difficulty) {
      const distance = this.getDistance(actualCoords, guessedCoords);
      const baseScore = Math.max(0, 1000 - distance * difficulty);
      const timeBonus = Math.max(0, 500 - timeTaken * 10);
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

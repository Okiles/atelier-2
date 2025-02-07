export default {
  methods: {
    calculateScore(actualCoords, guessedCoords, timeTaken, dist) {
      const distanceInMeters = this.getDistance(actualCoords, guessedCoords) * 1000; // Conversion en mètres
      const distanceRatio = Math.max(0, (dist - distanceInMeters) / dist);
      const baseScore = 1000 * distanceRatio;
      const timeBonus = baseScore > 0 ? 500 * Math.max(0, Math.min(1, (30 - timeTaken)/(30 - 2))) : 0;

      return Math.round(baseScore + timeBonus);
    },
    getDistance([lat1, lon1], [lat2, lon2]) {
      const R = 6371; // Rayon terrestre en km
      const dLat = (lat2 - lat1) * (Math.PI / 180);
      const dLon = (lon2 - lon1) * (Math.PI / 180);
      const a =
        Math.sin(dLat / 2) * Math.sin(dLat / 2) +
        Math.cos(lat1 * (Math.PI / 180)) *
        Math.cos(lat2 * (Math.PI / 180)) *
        Math.sin(dLon / 2) *
        Math.sin(dLon / 2);
      const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
      return R * c; // Distance en km
    },
  },
};

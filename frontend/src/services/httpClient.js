import { removeToken } from "./authProvider";

const BASE_URL = "http://localhost:42050"; // Changez en fonction de votre API

/**
 * Fonction générique pour envoyer des requêtes à l'API
 * @param {string} endpoint - L'endpoint de l'API
 * @param {string} method - La méthode HTTP (GET, POST, PATCH, etc.)
 * @param {Object|FormData|null} body - Le corps de la requête, peut être un objet ou un FormData
 * @param {boolean} isAuthRequest - Indique si la requête nécessite une authentification
 * @param {boolean} isFormData - Indique si le corps de la requête est un FormData (si c'est un fichier, par exemple)
 */
const request = async (
  endpoint,
  method = 'GET',
  body = null,
  isAuthRequest = false,
  isFormData = false
) => {
  const token = localStorage.getItem('token'); // Récupère le token dans le localStorage

  const headers = {
    ...(isAuthRequest && token && { Authorization: `Bearer ${token}` }), // Si authRequest et token, on ajoute l'en-tête Authorization
  };

  const config = {
    method,
    headers,
    ...(body && { body: isFormData ? body : JSON.stringify(body) }), // Si FormData, ne pas utiliser JSON.stringify
  };

  if (isFormData) {
    // Suppression du Content-Type car le navigateur gère automatiquement 'multipart/form-data' pour FormData
    delete config.headers['Content-Type'];
  } else {
    config.headers['Content-Type'] = 'application/json'; // Définit le Content-Type pour les requêtes JSON
  }

  try {
    const response = await fetch(`${BASE_URL}${endpoint}`, config); // Effectue la requête avec fetch

    if (response.status === 403 || response.status === 401) {
      removeToken(); // Si la réponse est 401 ou 403, on supprime le token et redirige vers la page de login
      window.location.href = '/login';
      return;
    }

    if (!response.ok) {
      const errorBody = await response.json(); // Si l'API renvoie une erreur, on la gère ici
      throw new Error(errorBody.message || 'Quelque chose a mal tourné');
    }

    const contentType = response.headers.get('content-type'); // Vérifie le type de contenu de la réponse
    return contentType && contentType.includes('application/json')
      ? await response.json() // Si c'est du JSON, on retourne la réponse JSON
      : null; // Sinon, retourne null si la réponse n'est pas au format JSON

  } catch (error) {
    console.error('Erreur API:', error); // Log l'erreur
    throw error; // Propague l'erreur
  }
};

/**
 * Fonction pour la connexion de l'utilisateur
 * @param {string} email - L'email de l'utilisateur
 * @param {string} password - Le mot de passe de l'utilisateur
 */
const login = (email, password) => {
  return request('/signin', 'POST', { email, password }, false); // Appelle la fonction request avec le corps de la requête
};

/**
 * Fonction pour l'inscription de l'utilisateur
 * @param {string} email - L'email de l'utilisateur
 * @param {string} password - Le mot de passe de l'utilisateur
 */
const register = (email, password) => {
  return request('/register', 'POST', { email, password }, false); // Appelle la fonction request pour l'inscription
};

/**
 * Fonction pour récupérer les informations de l'utilisateur
 */
const getUser = () => {
  return request('/user', 'GET', null, true); // Appelle la fonction request pour récupérer les données utilisateur
};

/**
 * Fonction pour mettre à jour les informations de l'utilisateur
 * @param {FormData} data - Données à mettre à jour sous forme de FormData
 */
const updateUser = (data) => {
  return request('/user', 'PATCH', data, true, true); // Appelle la fonction request avec le FormData pour mettre à jour l'utilisateur
};

/**
 * Fonction pour créer un jeu
 * @param {number} timer - La durée du jeu
 * @param {number} distance - La distance du jeu
 * @param {string} userId - L'ID de l'utilisateur
 */
const createGame = (timer, distance, userId) => {
  return request('/game', 'POST', {
    score: 0,
    status: "en cours",
    duree: timer,
    distance: distance,
    id_user: userId
  }, true); // Appelle la fonction request pour créer un jeu
};

/**
 * Fonction pour récupérer les jeux
 */
const getGames = () => {
  return request('/game', 'GET', null, false); // Appelle la fonction request pour récupérer la liste des jeux
};

/**
 * Fonction pour mettre à jour un jeu
 * @param {string} gameId - L'ID du jeu
 * @param {Object} data - Les données à mettre à jour
 */
const updateGame = (gameId, data) => {
  return request(`/game/${gameId}`, 'PATCH', data, true); // Appelle la fonction request pour mettre à jour un jeu
};

/**
 * Fonction pour récupérer l'état d'un jeu
 * @param {string} gameId - L'ID du jeu
 */
const getGameState = (gameId) => {
  return request(`/game/${gameId}`, 'GET', null, false); // Appelle la fonction request pour récupérer l'état d'un jeu
};

// Export des fonctions pour les utiliser ailleurs
export { request, login, getUser, register, createGame, getGames, getGameState, updateUser, updateGame };

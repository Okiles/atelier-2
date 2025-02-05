import { removeToken } from "./authProvider";

const BASE_URL = "http://localhost:42050";

const request = async (
  endpoint,
  method = 'GET',
  body = null,
  isAuthRequest = false
) => {

  const token = localStorage.getItem('token');


  const headers = {
    'Content-Type': 'application/json',
    ...(isAuthRequest && token && { Authorization: `Bearer ${token}` }),
  };


  const config = {
    method,
    headers,
    ...(body && { body: JSON.stringify(body) }),
  };

  try {
    const response = await fetch(`${BASE_URL}${endpoint}`, config);


    if (!response.ok) {
      const errorBody = await response.json();
      throw new Error(errorBody.message || 'Quelque chose a mal tourné');
    }

    const contentType = response.headers.get('content-type');
    const result = contentType && contentType.includes('application/json')
      ? await response.json()
      : null;
    return result;
  } catch (error) {
    console.error("❌ Erreur API attrapée :", error);
    throw error;
  }

};


const login = (email, password) => {
  return request('/signin', 'POST', {email, password }, false);
};
const register = (email, password) => {
  return request('/register', 'POST', {email, password }, false);
};

const getUser = () => {
  return request('/user', 'GET', null, true);
}

const createGame = async (timer, distance, userId) => {
  const body = {
    score: 0,
    status: "en cours",
    duree: timer,
    distance: distance,
    id_user: userId
  };

  console.log("🛠️ Envoi de la requête createGame avec le corps :", body);

  return request('/game', 'POST', body, true);
};


const getGames = () => {
  return request('/game', 'GET', null, false);
}


const getGameState = (gameId) => {
  return request(`/game/${gameId}`, 'GET', null, false);
}

const giveCoordinates = (gameId,x,y) => {
  return request(`/game/${gameId}/coordinates`, 'POST', {x,y}, false);
}
export { request, login, getUser ,register, createGame, getGames, getGameState, giveCoordinates };





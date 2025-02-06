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


    if (response.status === 403 || response.status === 401) {
      removeToken();
      window.location.href = '/login';
      return;
    }

    if (!response.ok) {
      const errorBody = await response.json();
      throw new Error(errorBody.message || 'Quelque chose a mal tourné');
    }


    const contentType = response.headers.get('content-type');
    return contentType && contentType.includes('application/json')
      ? await response.json()
      : null;

  } catch (error) {

    console.error('Erreur API:', error);
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

const updateUser = (data) => {
  return request('/user','PATCH', data, true);
}

const createGame = (timer, distance, userId) => {
  return request('/game', 'POST', {
    score: 0,
    status: "en cours",
    duree: timer,
    distance: distance,
    id_user: userId
  }, true);
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
export { request, login, getUser ,register, createGame, getGames, getGameState, giveCoordinates, updateUser };




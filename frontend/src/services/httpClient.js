import { removeToken } from "./authProvider";

const BASE_URL = import.meta.env.VITE_API_BASE_URL;


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


const login = (username, email, password) => {
  return request('/login', 'POST', {email, password }, false);
};
const register = (username, email, password) => {
  return request('/register', 'POST', {email, password }, false);
};

const createGame = (timer,distance) => {
  return request('/game', 'POST', {timer,distance }, true);
};

const getGames = () => {
  return request('/game', 'GET', null, true);
}
export { request, login, register, createGame, getGames };





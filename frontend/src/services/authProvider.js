import {jwtDecode} from 'jwt-decode';


const isAuthenticated = () => {
  const token = localStorage.getItem("token");
  return !!token;
};

const removeToken = () => {
  localStorage.removeItem("token");
};

const setToken = (token) => {
  localStorage.setItem("token", token);
};

const getUserIdentity = () => {
  const token = localStorage.getItem("token");
  return token ? jwtDecode(token) : null;
};

const getGameIdentity = () => {
  const token = localStorage.getItem("gameToken");
  return token ? jwtDecode(token) : null;
};

export { isAuthenticated, removeToken, setToken, getUserIdentity, getGameIdentity };

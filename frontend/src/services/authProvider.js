const isAuthenticated = () => {
  const token = localStorage.getItem('token');
  return !!token;
};

const removeToken = () => {
  localStorage.removeItem('token');
};

const setToken = (token) => {
  localStorage.setItem('token', token);
};

const getUserIdentity = () => {
  return localStorage.getItem('token');
}

export { isAuthenticated, removeToken, setToken, getUserIdentity };

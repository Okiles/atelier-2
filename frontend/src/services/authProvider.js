// authProvider.js
const decodeToken = (token) => {
  try {
    const base64Url = token.split('.')[1];
    const base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
    const jsonPayload = decodeURIComponent(atob(base64).split('').map((c) => {
      return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
    }).join(''));

    const payload = JSON.parse(jsonPayload);
    return {
      id: payload.id,
      email: payload.email
    };
  } catch (error) {
    console.error('Erreur de décodage du token:', error);
    return null;
  }
};

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
  const token = localStorage.getItem('token');
  return token ? decodeToken(token) : null;
};

export { isAuthenticated, removeToken, setToken, getUserIdentity };

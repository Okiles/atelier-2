import { createRouter, createWebHistory } from 'vue-router'
import Login from '../views/Login.vue'
import Register from '../views/Register.vue'
import Dashboard from '../views/Dashboard.vue'
import CreateGame from '../views/CreateGame.vue'
import Game from '../views/Game.vue'

import { isAuthenticated } from '../services/authProvider.js';
import Profile from '@/views/Profile.vue'

const routes = [
  {
    path: '/login',
    name: 'Login',
    component: Login,
    meta: { requiresAuth: false },
  },
  {
    path: '/register',
    name: 'Register',
    component: Register,
    meta: { requiresGuest: true },
  },
  {
    path: '/',
    name: 'Dashboard',
    component: Dashboard,
    meta: { requiresAuth: false },
  },
  {
    path: '/createGame',
    name: 'CreateGame',
    component: CreateGame,
    meta: { requiresAuth: true },
  },
  {
    path: '/game/:id',
    name: 'Game',
    component: Game,
    meta: { requiresAuth: true },
  },
  {
    path: '/profile',
    name: 'Profile',
    component: Profile,
    meta: { requiresAuth: true },
  }


]

const router = createRouter({
  history: createWebHistory(),
  routes,
});

router.beforeEach((to, from, next) => {
  const isLogged = isAuthenticated();


  if (to.meta.requiresAuth && !isLogged) {
    return next('/login');
  }

  if (to.meta.requiresGuest && isLogged) {
    return next('/');
  }


  next();
});


export default router

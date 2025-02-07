<script>
import {RouterLink ,RouterView} from 'vue-router';
</script>

<template>
  <header>
    <div class ="wrapper">
      <nav>
        <RouterLink to ="/login"></RouterLink>
        <RouterLink to ="/register"></RouterLink>
        <RouterLink to ="/"></RouterLink>
      </nav>
    </div>
  </header>

  <RouterView />
</template>

<style>
body {
  margin: 0;
  padding: 0;
  font-family: sans-serif;
  background: #f8f9fa;
}

#wrapper {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>

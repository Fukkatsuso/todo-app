<template>
  <div id="app">
    <div id="nav">
      <router-link to="/">Home</router-link> | 
      <router-link to="/todo">TodoList</router-link> | 
      <router-link to="/todo/new">CreateTodo</router-link>
    </div>
    <router-view/>
  </div>
</template>

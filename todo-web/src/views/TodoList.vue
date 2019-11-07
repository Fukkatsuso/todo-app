<template>
  <div class="todo-list">
    <table>
      <tr>
        <th>id</th>
        <th>title</th>
        <th>content</th>
      </tr>
      <tr v-for="todo in todos" v-bind:key="todo.id">
        <td>{{ todo.id }}</td>
        <td>{{ todo.title }}</td>
        <td>{{ todo.content }}</td>
      </tr>
    </table>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'TodoList',
  data() {
    return {
      todos: null
    }
  },
  mounted() {
    axios
      .get('/api/todo')
      .then(response => (this.todos = response.data))
      .catch(error => console.log(error))
  }
}
</script>
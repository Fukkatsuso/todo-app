<template>
  <div class="todo-list">
    <table>
      <tr>
        <th>id</th>
        <th>title</th>
        <th>content</th>
        <th>delete</th>
      </tr>
      <tr v-for="todo in todos" v-bind:key="todo.id">
        <td>{{ todo.id }}</td>
        <td>{{ todo.title }}</td>
        <td>{{ todo.content }}</td>
        <td><button v-on:click="deleteTodo(todo.id)">delete</button></td>
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
    this.getTodos()
  },
  methods: {
    getTodos: function() {
      axios
        .get('/api/todo')
        .then(response => (this.todos = response.data))
        .catch(error => console.log(error))
    },
    deleteTodo: function(id) {
      axios
        .delete('/api/todo/' + id)
        .then(response => console.log(response))
        .catch(error => console.log(error))
      this.getTodos()
    }
  }
}
</script>
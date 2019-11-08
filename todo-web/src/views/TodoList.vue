<template>
  <div class="todo-list">
    <table>
      <tr>
        <th>id</th>
        <th>title</th>
        <th>content</th>
        <th>edit</th>
        <th>delete</th>
      </tr>
      <tr v-for="todo in todos" v-bind:key="todo.id">
        <td>{{ todo.id }}</td>
        <td>{{ todo.title }}</td>
        <td>{{ todo.content }}</td>
        <td><router-link :to="`/todo/${todo.id}`">edit</router-link></td>
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
      todos: []
    }
  },
  created() {
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
      // todos配列からも削除
      this.todos = this.todos.filter(t => t.id !== id)
    }
  }
}
</script>
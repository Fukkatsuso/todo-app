<template>
  <div class="todo-list">
    <select name="todos" v-model="selectedCategoryId" v-on:change="getTodosByCategory(selectedCategoryId)">
      <option v-for="category in categories" v-bind:value="category.id" v-bind:key="category.id">
        {{ category.title }}
      </option>
    </select>

    <table>
      <tr>
        <th>category</th>
        <th>title</th>
        <th>content</th>
        <th>edit</th>
        <th>delete</th>
      </tr>
      <tr v-for="todo in todos" v-bind:key="todo.id">
        <td>{{ todo.category_title }}</td>
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
      todos: [],
      categories: [],
      selectedCategoryId: 0
    }
  },
  created() {
    this.getCategories()
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
    },
    getCategories: function() {
      this.categories = [{"id": 0, "title": "all"}] // デフォルト値。全取得用
      axios
        .get('/api/category')
        .then(response => (this.categories = this.categories.concat(response.data)))
        .catch(error => console.log(error))
      
    },
    getTodosByCategory: function(id) {
      if (id === 0) {
        this.getTodos()
      }
      else {
        axios
          .get('/api/category/' + id)
          .then(response => (this.todos = response.data))
          .catch(error => console.log(error))
      }
    },
  }
}
</script>
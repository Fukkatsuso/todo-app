<template>
  <div class="todo-edit">
    <form v-on:submit.prevent="updateTodo(todo.id)">
      <table>
        <tr>
          <td>category</td>
          <td>
            <select name="categories" v-model="todo.category_id">
              <option v-for="category in categories" v-bind:value="category.id" v-bind:key="category.id">
                {{ category.title }}
              </option>
            </select>
          </td>
        </tr>
        <tr>
          <td>title</td>
          <td><input v-model="todo.title" type="text" placeholder="title"/></td>
        </tr>
        <tr>
          <td>content</td>
          <td><textarea v-model="todo.content" type="text" placeholder="content"/></td>
        </tr>
      </table>
      <button type="submit">update!</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'TodoEdit',
  data() {
    return {
      todo: {},
      categories: []
    }
  },
  created() {
    this.getCategories()
    this.getTodo(this.$route.params.id)
  },
  methods: {
    getCategories: function() {
      axios
        .get('/api/category')
        .then(response => (this.categories = response.data))
        .catch(error => console.log(error))
    },
    getTodo(id) {
      axios
        .get('/api/todo/' + id)
        .then(response => (this.todo = response.data[0]))
        .catch(error => console.log(error))
    },
    updateTodo: function(id) {
      let params = new URLSearchParams()
      if (this.todo.title != '') {
        params.append('title', this.todo.title)
        params.append('content', this.todo.content)
        params.append('category_id', this.todo.category_id)
        axios.put('/api/todo/' + id, params)
        this.$router.push('/todo')
      }
    }
  }
}
</script>
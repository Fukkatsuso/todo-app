<template>
  <div class="todo-new">
    <form v-on:submit.prevent="createTodo">
      <table>
        <tr>
          <td>category</td>
          <td>
            <select name="category" v-model="todo.category_id">
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
      <button type="submit">create!</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'TodoNew',
  data() {
    return {
      todo: {
        title: '',
        content: '',
        category_id: 1
      },
      categories: []
    }
  },
  created() {
    this.getCategories()
  },
  methods: {
    getCategories: function() {
      axios
        .get('/api/category')
        .then(response => (this.categories = response.data))
        .catch(error => console.log(error))
    },
    createTodo: function() {
      let params = new URLSearchParams()
      if (this.todo.title != '') {
        params.append('title', this.todo.title)
        params.append('content', this.todo.content)
        params.append('category_id', this.todo.category_id)
        axios.post('/api/todo', params)
        this.$router.push('/todo')
      }
    }
  }
}
</script>
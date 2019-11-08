<template>
  <div class="todo-edit">
    <form v-on:submit.prevent="updateTodo(todo.id)">
      <input v-model="todo.title" type="text" placeholder="title"/>
      <textarea v-model="todo.content" type="text" placeholder="content"/>
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
      todo: {}
    }
  },
  mounted() {
    axios
      .get('/api/todo/' + (this.$route.params.id))
      .then(response => (this.todo = response.data[0]))
      .catch(error => console.log(error))
  },
  methods: {
    updateTodo: function(id) {
      let params = new URLSearchParams()
      if (this.todo.title != '') {
        params.append('title', this.todo.title)
        params.append('content', this.todo.content)
        axios.put('/api/todo/' + id, params)
        this.$router.push('/todo')
      }
    }
  }
}
</script>
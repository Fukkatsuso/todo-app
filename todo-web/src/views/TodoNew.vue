<template>
  <div class="todo-new">
    <form v-on:submit.prevent="submit">
      <input v-model="todo.title" type="text" placeholder="title"/>
      <textarea v-model="todo.content" type="text" placeholder="content"/>
      <button type="submit">create!</button>
    </form>
    <div>{{ todo.title }}</div>
    <div>{{ todo.content }}</div>
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
        content: ''
      }
    }
  },
  methods: {
    submit: function() {
      let params = new URLSearchParams()
      if (this.todo.title != '') {
        params.append('title', this.todo.title)
        params.append('content', this.todo.content)
        axios.post('/api/todo', params)
        this.$router.push('/todo')
      }
    }
  }
}
</script>
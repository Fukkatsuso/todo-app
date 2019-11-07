<template>
  <div class="home">
    {{ info }}
  </div>
</template>

<script>
import axios from 'axios'

export default {
  name: 'home',
  data() {
    return {
      info: null
    }
  },
  mounted() {
    axios
      .get("/api")
      .then(response => (this.info = response))
      .catch(error => console.log(error))
  }
}
</script>

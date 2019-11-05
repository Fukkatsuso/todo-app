<template>
  <div class="home">
    {{ info }}
  </div>
</template>

<script>
// import axios from 'axios'
// vue add axios でできるらしい

export default {
  name: 'home',
  data() {
    return {
      info: null
    }
  },
  mounted() {
    axios
      .get("http://localhost:8080/")
      .then(response => (this.info = response))
      .catch(error => console.log(error))
  }
}
</script>

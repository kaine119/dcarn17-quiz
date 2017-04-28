<template>
  <section>
    <h1 class="score">Score: {{ score }}</h1>
    <input type="submit" value="Play again" @click="restart()">   
  </section>
</template>

<script>
  export default {
    name: "score",
    props: ["score"],
    methods: {
      restart () {
        this.$emit("restart");
      }
    }
  };
</script>

<style scoped>
  section {
    height: 30em;
    display: -webkit-flex;
    display: -moz-flex;
    display: -ms-flex;
    display: -o-flex;
    display: flex;
    justify-content: center;
    align-content: center;

  }
</style>
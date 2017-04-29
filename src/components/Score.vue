<template>
  <section>
    <h1 class="score">Score: {{ score }}</h1>
    <button class="mdl-button mdl-button--raised mdl-button--colored" @click="restart()">Play Again</button>
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
    -webkit-flex-direction: column;
    -moz-flex-direction: column;
    -ms-flex-direction: column;
    -o-flex-direction: column;
    flex-direction: column;
  }
</style>
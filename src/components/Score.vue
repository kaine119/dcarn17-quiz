<template>
  <section class="mdl-grid">
    <div class="mdl-cell mdl-cell--5-col mdl-cell--3-col-tablet mdl-cell--1-col-phone"></div>
    <div class="mdl-cell mdl-cell--2-col" id="main">
      <h1 class="score">Score: {{ score }}</h1>
      <button class="mdl-button mdl-button--raised mdl-button--colored" @click="restart()">Play Again</button>
    </div>
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
  #main {
    display: -webkit-flex;
    display: -moz-flex;
    display: -ms-flex;
    display: -o-flex;
    display: flex;
    -webkit-flex-direction: column;
    -moz-flex-direction: column;
    -ms-flex-direction: column;
    -o-flex-direction: column;
    flex-direction: column;
    -ms-align-items: center;
    align-items: center;
  }
</style>
<template>
  <section class="mdl-grid">
    <div v-if="mainMenu" class="mdl-cell mdl-cell--1-col mdl-cell-3-col-tablet mdl-cell--1-col-phone"></div>
    <div class="mdl-cell mdl-cell--10-col mdl-shadow--2dp" id="main" v-if="mainMenu">
      <h1>How well do you know Dunman High?</h1>
      
      <div>
        <button class="mdl-button mdl-button--raised mdl-button--colored " @click="restart()">Play</button>
      </div>
      <img :src="loadImage()">
    </div>
    <div v-if="!mainMenu" class="mdl-cell mdl-cell--5-col mdl-cell--3-col-tablet mdl-cell--1-col-phone"></div>
    <div class="mdl-cell mdl-cell--2-col" id="main" v-if="!mainMenu">
      <h1 class="score">Score: {{ score }}</h1>

      <button class="mdl-button mdl-button--raised mdl-button--colored"  @click="restart()">Play again</button> 
      <button class="mdl-button mdl-button--raised mdl-button--colored" @click="quit()" >Quit</button>
      
    </div>
  </section>
</template>

<script>

  export default {
    name: "score",
    props: ["score"],
    data () {
      return {
        mainMenu: false
      }
    },
    methods: {
      restart () {
        this.$emit("restart");
      },
      quit () {
        this.mainMenu = true;
      },
      loadImage () {
        return require("../assets/question-imgs/Dunman-High-School2-1024x1024.jpg")
      }
    }
  };
</script>

<style scoped>
  #main, #main-menu {
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
    justify-content: center;
  }
  button {
    margin-bottom: 1em;
  }
  img {
    width: 30em;
  }
</style>
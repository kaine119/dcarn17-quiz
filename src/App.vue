<template>
  <div id="app">
    <question v-bind:question="currentQuestion" v-on:choice="checkChoice" v-if="playing && !intermission"></question>
    <score v-bind:score="score" v-if="!playing" v-on:restart="restart()"></score>
    <achievement v-if="intermission" v-bind:achievement="achievements[counter]" v-on:next="intermission = false"></achievement>
  </div>
</template>

<script>
import data from './assets/data';
import shuffle from './utils/shuffle';
import Question from './components/Question.vue';
import Score from './components/Score.vue';
import Achievement from './components/Achievement.vue'

require('material-design-lite');

export default {
  name: 'app',
  data () {
    return {
      counter: 0,
      score: 0,
      currentQuestion: shuffle(data.questions)[0],
      achievements: shuffle(data.achievements),
      playing: true,
      intermission: false
    }
  },
  components: {
    Question,
    Score,
    Achievement
  },
  methods: {
    checkChoice (choice) {
      if (choice) {
        this.score += 1; 
      }
      this.counter += 1;
      if (!(this.counter > 2)) {
        this.intermission = true;
        this.currentQuestion = data.questions[this.counter]
        this.currentQuestion.answers = shuffle(this.currentQuestion.answers);
      } else {
        this.playing = false;
      }
    },
    restart () {
      this.counter = 0;
      this.score = 0;
      this.currentQuestion = shuffle(data.questions)[0];
      this.playing = true;
    }
  }
}
</script>

<style>
@import url('https://fonts.googleapis.com/icon?family=Material+Icons');
@import url('https://code.getmdl.io/1.2.1/material.blue-red.min.css');
#app {

  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  display: -webkit-flex;
  display: -moz-flex;
  display: -ms-flex;
  display: -o-flex;
  display: flex;
  justify-content: center;
  -ms-align-items: center;
  align-items: center;
  color: #2c3e50;
  -webkit-flex-direction: column;
  -moz-flex-direction: column;
  -ms-flex-direction: column;
  -o-flex-direction: column;
  flex-direction: column;
}

h1, h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}
</style>

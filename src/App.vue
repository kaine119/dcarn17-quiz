<template>
  <div id="app">
    <question v-bind:question="currentQuestion" v-on:choice="checkChoice" v-if="playing"></question>
    <score v-bind:score="score" v-if="!playing" v-on:restart="restart()"></score>
  </div>
</template>

<script>
import data from './assets/data';
import shuffle from './utils/shuffle'
import Question from './components/Question.vue';
import Score from './components/Score.vue'

export default {
  name: 'app',
  data () {
    return {
      counter: 0,
      score: 0,
      currentQuestion: shuffle(data.questions)[0],
      playing: true
    }
  },
  components: {
    Question,
    Score
  },
  methods: {
    checkChoice (choice) {
      if (choice) {
        this.score += 1; 
      }
      this.counter += 1;
      if (!(this.counter > 2)) {
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
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
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
  margin-top: 60px;
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

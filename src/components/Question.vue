<template>
  <section>
    <h1>{{ question.text }}</h1>
    <img :src="loadQuestionImage(question.image)" alt="">
    <div v-for="answer in question.answers">
      <input type="submit" @click="submitChoice(answer)" v-bind:value="answer.text">
    </div>
    <div class="nextButton" @click="emitChoice()" v-if="choiceChosen" :class="{correct: answerCorrect}"><h1>next</h1></div>
  </section>
</template>

<script>
  import shuffle from '../utils/shuffle';

  export default {
    name: 'questionBlock',
    props: ['question'],
    data () { 
      return { 
        choiceChosen: false, 
        answerCorrect: null
      }; 
    },
    methods: {
      submitChoice (answer) {
        this.choiceChosen = true;
        this.answerCorrect = answer.correct;
      },
      emitChoice () {
        this.$emit('choice', this.answerCorrect);
        console.log(this.answerCorrect);
        this.choiceChosen = false;
      },
      shuffleAnswers: shuffle,
      loadQuestionImage (name) {
        console.log('../assets/question-imgs/' + name)
        return require("../assets/question-imgs/" + name)
      }
    }
  }
</script>

<style>
  .nextButton { background: red; height: 3em; width: 25%; cursor: pointer;}
  .correct { background: green; }
  section, .nextButton {
    width: 50%;
    display: -webkit-flex;
    display: -moz-flex;
    display: -ms-flex;
    display: -o-flex;
    display: flex;
    -ms-align-items: center;
    align-items: center;
    justify-content: center;
    -webkit-flex-direction: column;
    -moz-flex-direction: column;
    -ms-flex-direction: column;
    -o-flex-direction: column;
    flex-direction: column;
  }
  img {
    height: 20em;
  }
</style>
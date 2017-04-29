<template>
  <section>


    <!-- Card with question in it -->
    <div id="question-block" class=" mdl-card mdl-shadow--2dp">

      <div class="mdl-card__title">
        <h1 class="mdl-card__title-text">{{ question.text }}</h1>
      </div>

      <div class="mdl-card__media" background="white">
        <img width="120" :src="loadQuestionImage(question.image)" alt="" />
      </div>

      <div class="mdl-card__supporting-text mdl-card--border" v-if="!choiceChosen">
        
        <div v-for="answer in question.answers" @click="!choiceChosen && submitChoice(answer, $event)" href="#" class="answer mdl-js-button mdl-js-ripple-effect ">

          <h4>{{ answer.text }}</h4>
        </div>

      </div>

      <div class="mdl-card__supporting-text" v-if="choiceChosen">
        <h6 v-if="!chosenAnswer.correct">You chose:</h6>
        <h4 v-if="!chosenAnswer.correct" v-bind:class="{'mdl-color-text--red-500': !chosenAnswer.correct}">{{ chosenAnswer.text }}</h4>
        <h6 v-if="!chosenAnswer.correct">The correct answer is</h6>
        <h6 v-if="chosenAnswer.correct">You're correct! The answer is</h6>
        <h4 class="mdl-color-text--green-500" v-for="answer in question.answers" v-if="answer.correct">{{ answer.text }}</h4>
      </div>
      
    </div>

    
    <!-- FAB with right arrow -->
    <button class="mdl-button mdl-js-button mdl-button--fab mdl-button--colored mdl-shadow--4dp" @click="emitChoice()" v-if="choiceChosen">
      <i class="material-icons">arrow_forward</i>
    </button>
  </section>
</template>

<script>
  import shuffle from '../utils/shuffle';
  let green = 'mdl-color--green-400';
  let red = 'mdl-color--red-500';

  export default {
    name: 'questionBlock',
    props: ['question'],
    data () { 
      return { 
        choiceChosen: false, 
        answerCorrect: null,
        chosenAnswer: null,
        buttonSelected: null,
        correctAnswer: null,
      }; 
    },
    methods: {
      submitChoice (answer, e) {
        this.choiceChosen = true;
        this.chosen = true;
        this.answerCorrect = answer.correct;
        this.buttonSelected = e.target
        this.chosenAnswer = answer
        this.buttonSelected.classList.add( answer.correct ? green : red);

      },
      emitChoice () {
        this.choiceChosen = false;
        this.$emit('choice', this.answerCorrect);
        this.choiceChosen = false; 
        this.answerCorrect = null;
        this.chosenAnswer = null;
        this.buttonSelected = null;
        this.correctAnswer = null;
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
  section {
    width: 100%;
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
  #question-block {
    width: 50%;
  }
  img {
    width: 100%;
  }
  button.mdl-button--fab {
    margin-top: 1em;
  }
  .answer {
    cursor: pointer;
  }
  @media (max-width: 768px) {
    button.mdl-button--fab {
      position: fixed;
      right: 0;
      bottom: 0;
      margin-right: 10px;
      margin-bottom: 10px;
      z-index: 10;
    }
    #question-block {
      width: 100%;
    }
  }
</style>
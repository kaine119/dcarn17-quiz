<template>
  <section>
    <div class="mdl-grid">
      <div class="mdl-cell mdl-cell--3-col mdl-cell--hide-phone mdl-cell--hide-tablet"></div>
      <div class="mdl-cell mdl-cell--6-col mdl-card mdl-shadow--2dp">
        <div class="mdl-card__title" id="achievement-title">
          <h1 class="mdl-card__title-text">{{ achievement.title }}</h1>
        </div>
        <div class="mdl-card__media">
          <img :src="loadImage(achievement.image)">
        </div>
        <div class="mdl-card__supporting-text mdl-color-text--grey-800">
          {{ achievement.body }}
        </div>
      </div>
    </div>
    <button class="mdl-button mdl-js-button mdl-button--fab mdl-button--colored mdl-shadow--4dp" @click="emitNext()">
      <i class="material-icons">arrow_forward</i>
    </button>
  </section>
</template>


<script>
  export default {
    props: ['achievement'],
    methods: {
      loadImage (name) {
        return require("../assets/achievement-imgs/" + name)
      },
      emitNext () {
        this.$emit('next');
      }
    }
  }
</script>


<style scoped>

  @media (max-width: 768px) {
    button.mdl-button--fab {
      position: fixed;
      right: 0;
      bottom: 0;
      margin-right: 10px;
      margin-bottom: 10px;
      z-index: 10;
    }
  }
</style>
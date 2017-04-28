<template>
  <section>
    <h1 class="score">{{ score }}</h1>
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

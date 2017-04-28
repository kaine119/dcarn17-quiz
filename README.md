# dcarn17-quiz

> Quiz for D'Carn 2017

## Build Setup

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build
```

For detailed explanation on how ~~things~~ `.vue` components work in general, consult the [docs for vue-loader](http://vuejs.github.io/vue-loader).

## The components
* [**`App.vue`**](./src/App.vue): the main container of the app
	- keeps questions sourced from [`assets/data.js`](./src/assets/data.js)
	- hosts the question `counter` and `score`
	- in charge of checking whether choice (from `Question.vue`) is correct, and to increment score if it is
	- in charge of keeping track of number of questions answered
	- displays `Question.vue` and `Score.vue`

* [**`Question.vue`**](./src/components/Question.vue): a component to display a single question
	- takes a **question** object as a prop (n.b.: make sure to use `v-bind`)
	- displays `question.name`, `question.image`, and 4 * answer in `question.answers`
	- emits a `choice` event when a choice is picked and "next" is clicked

* [**`Score.vue`**](./src/components/Score.vue): a component to display the final score
	- takes a **score** number as a prop
	- just displays the score, and a button to restart
	- emits a `restart` event when the restart button is clicked

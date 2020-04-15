<template>
  <div>
    <div class="exercise-img-instructions">
      <div class="exercise-instructions">
        <div class="exercise">
          <h3 style="text-decoration: underline">{{exercise.name}}</h3>

          <ul>
            <li class="unordered" v-if="exercise.reps > 20">Reps: {{exercise.reps}} Seconds</li>
            <li class="unordered" v-if="exercise.reps < 20">Reps: {{exercise.reps}}</li>
            <li>Sets: {{exercise.sets}}</li>
          </ul>
        </div>

        <div class="instructions">
          <h3 style="text-decoration: underline">Instructions</h3>
          <ol class="ordered">
            <li v-for="item in createInstructions" v-bind:key="item">{{item}}</li>
          </ol>
        </div>
      </div>

      <div class="img">
        <!-- <img id='exerciseImage' src="../img/placeHolder.jpg"/> -->

        <iframe width="420" height="315" id="myIframe" :src="videoLink()"></iframe>
      </div>
    </div>

    <div class="notes">
      <h4 style="text-align: left">Notes:</h4>
      <p style="text-align: right">notes here</p>
    </div>
  </div>
</template>


<script>
export default {
  name: "exercise-in-workout",
  data() {
    return {
      instructions: [],
      value: 33.333333333,
      max: 100
    };
  },
  props: {
    exercise: Object
  },
  methods: {
  },

  computed: {
    createInstructions() {
      let instructions = this.exercise.description.split(".");
      return instructions;
    },
     videoLink() {
      let link = "https://www.youtube.com/embed/" + this.exercise.yt_link;
      document.getElementById("myIframe").src = link;
      return link;
    }
  },
  
};
</script>

<style scoped>
.meter {
  height: 20px; /* Can be anything */
  position: relative;
  background: #555;
  -moz-border-radius: 25px;
  -webkit-border-radius: 25px;
  border-radius: 25px;
  padding: 10px;
  box-shadow: inset 0 -1px 1px rgba(255, 255, 255, 0.3);
}
.meter > span {
  display: flex;
  height: 100%;
  border-top-right-radius: 8px;
  border-bottom-right-radius: 8px;
  border-top-left-radius: 20px;
  border-bottom-left-radius: 20px;
  background-color: rgb(36, 247, 46);
  background-image: linear-gradient(
    center bottom,
    rgb(43, 194, 83) 37%,
    rgb(84, 240, 84) 69%
  );
  box-shadow: inset 0 2px 9px rgba(255, 255, 255, 0.3),
    inset 0 -2px 6px rgba(0, 0, 0, 0.4);
  position: relative;
  overflow: hidden;
}
.unordered {
  list-style-type: none;
  text-align: left;
}
.exercise {
  background-color: red;
  display: flex;
  flex-direction: column;
  height: 50%;
}
.img {
  background-color: blue;
  height: 100%;
  width: 50%;
}
#exerciseImage {
  height: 100%;
  object-fit: cover;
}
.notes {
  background-color: green;
  display: flex;
  margin-top: 8%;
  width: 18%;
}
.instructions {
  background-color: cyan;
  width: 100%;
  height: 50%;
  text-align: center;
}
.exercise-img-instructions {
  display: flex;
  margin: auto;
  margin-top: 4%;
  width: 90%;
  height: 450px;
  background-color: yellow;
}
.exercise-instructions {
  background-color: green;
  display: flex;
  flex-direction: column;

  width: 50%;
}
.ordered {
  text-align: left;
}
</style>
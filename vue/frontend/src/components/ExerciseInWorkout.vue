<template>
  <div>
    <div class="exercise-img-instructions">
      
      <div class="exercise-instructions">
        
        <div class="exercise">
          
          <h3 id="exercise-name">{{exercise.name}}</h3>

          <div class="setsReps">
            <p> Sets: {{exercise.sets}}</p>
            <p  v-if="exercise.reps > 20">Reps: {{exercise.reps}} Seconds</p>
            <p  v-if="exercise.reps < 20">Reps: {{exercise.reps}}</p>
            
          </div>

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

        <iframe width="420" height="315" id="myIframe" :src="videoLink"></iframe>
      </div>
    </div>

    <div class="notes">
      <h4 id='noteHeading'>Notes:</h4>
      <textarea id="textBox" placeholder="Exercise Notes Here"/> 
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
      let link = "https://www.youtube.com/embed/" + this.exercise.ytLink;

      return link;
    }
  },
  
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Oswald&display=swap');

* { 
  font-family: 'Oswald', sans-serif;
}
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
#exercise-name{
  text-decoration: underline white;
  text-align: center;
  font-size: 250%;
  margin-bottom:0;
  margin-top: 2%;
  background-image: radial-gradient(
    rgba(0, 0, 0, 0.5),
    rgba(0, 0, 0, 0.1),
    rgba(0, 0, 0, 0),
    rgba(0, 0, 0, 0)
  );
}
.exercise {
  color:white;
  display: flex;
  flex-direction: column;
  height: 30%;
  background-color: rgba(0, 0, 0, 0.75);
  border-radius: 5px;
}
.setsReps{
  /* background-color:green; */
  display:flex;
  justify-content: space-around;
}
.setsReps p{
  text-align:center;
  /* background-color:black; */
  width:40%;
  font-size: 200%;
  margin:2%;
  background-image: radial-gradient(
    rgba(0, 0, 0, 0.7),
    rgba(0, 0, 0, 0.2),
    rgba(0, 0, 0, 0),
    rgba(0, 0, 0, 0)
  );
}
.img {
  /* background-color: blue; */
  height: 100%;
  width: 46%;
}

#myIframe {
  height: 100%;
  width:100%;
  border-radius:5px;
}

.notes {
  /* background-color: green; */
  display: flex;
  background-color: rgba(0, 0, 0, 0.75);
  border-radius: 5px;
  width: 84%;
  margin:auto;
  margin-top: 2%;
  padding:1%;
  justify-content: space-around;
}
#noteHeading{
  font-size: 200%;
  margin:0;
  text-align: center;
  color:white;
}
#textBox{
  font-size: 100%;
  width:70% !important;
}
.instructions {
  background-color: rgba(0, 0, 0, 0.75);
  border-radius: 5px;
  width: 100%;
  height: 67%;
  text-align: center;
  color:white;
  font-size: 100%;

}
.exercise-img-instructions {
  display: flex;
  margin: auto;
  padding-top: 4%;
  width: 90%;
  height: 450px;
  justify-content: space-around;
  /* background-color: yellow; */
}
.exercise-instructions {
  /* background-color: green; */
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  width: 46%;
}
.ordered {
  text-align: left;
}
</style>
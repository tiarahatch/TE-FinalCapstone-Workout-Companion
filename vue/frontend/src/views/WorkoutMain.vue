<template>

    <div id="wholePage">
        
    <b-progress :value="value" :max="max" :precision="2" show-value class="mb-3"></b-progress>
        <!-- <div v-for='item in exercises' v-bind:key='item.exerciseID' class='exercisePage'> -->

        <exercise-in-workout v-bind:exercise = 'currentExercise'></exercise-in-workout>
        
        <button id="nextButton" v-on:click='changeExercise()' @click="randomValue" >Next</button>
        <!-- </div> -->

    </div>
</template>


<script>
import ExerciseInWorkout from '@/components/ExerciseInWorkout'
export default {
    data(){
        return{
        value: 33.3,
        max: 100,
        currentExercise:[],
        currentArrayPosition: 0
      }
    },
    methods:{
        changeExercise(){
            if (this.currentArrayPosition == this.exercises.length-2){
                document.getElementById('nextButton').innerText= "Finish";
            }

           if(this.currentArrayPosition == this.exercises.length-1){
                this.$router.push({path:"/EndWorkout"});
           }else if(this.currentArrayPosition < this.exercises.length){
                this.currentArrayPosition++;
                this.currentExercise = this.exercises[this.currentArrayPosition];
            }

        },
        randomValue() {
        this.value = Math.random() * this.max
      }
    },

    components:{
        ExerciseInWorkout,
    },

    props:{
        exercises: []
    },
created(){
    this.currentExercise = this.exercises[0];
    this.currentArrayPosition = 0
}

}
</script>

<style scoped>

#wholePage{
    width:100%;
    min-height:100vh;
    background-image: url('../img/workoutBackground4.png');

}

#nextButton{
justify-content: center;
  display: flex;
  font-size: 200%;
  border: none;
  width: 25%;
  height: 25%;
  background-color: rgba(0, 0, 0, 0.5);
  color: white;
  cursor: pointer;
  border-radius: 5px;
  margin-left:62.5%;
  margin-top:2%;

  transition: 0.6s;
    
}
#nextButton:hover {
  background-color: rgba(0, 0, 0, 0.75);
  box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);
}
</style>
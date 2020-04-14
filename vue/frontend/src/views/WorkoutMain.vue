<template>
    <div>

        <!-- <div v-for='item in exercises' v-bind:key='item.exerciseID' class='exercisePage'> -->

        <exercise-in-workout v-bind:exercise = 'currentExercise'></exercise-in-workout>
        
        <button id="buttonMain" v-on:click='changeExercise()'>Done </button>
        <!-- </div> -->

    </div>
</template>


<script>
import ExerciseInWorkout from '@/components/ExerciseInWorkout'
export default {
    data(){
        return{
        currentExercise:[],
        currentArrayPosition: 0
      }
    },
    methods:{
        changeExercise(){
           if(this.currentArrayPosition == this.exercises.length-1){
                this.$router.push({path:"/EndWorkout"});
           }else if(this.currentArrayPosition < this.exercises.length){
                this.currentArrayPosition++;
                this.currentExercise = this.exercises[this.currentArrayPosition];
            }

        },
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


</style>
<template>
    <div>

        <div v-for='item in exercises' v-bind:key='item.exerciseID' class='exercisePage'>

        <exercise-in-workout v-bind:exercise = 'item'></exercise-in-workout>
        </div>

    </div>
</template>


<script>
import ExerciseInWorkout from '@/components/ExerciseInWorkout'
export default {
    data(){
        return{

      
      }
    },
    

    components:{
        ExerciseInWorkout,
    },

    props:{
        exercises: []
    }


}
</script>

<style scoped>


</style>
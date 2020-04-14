<template>
    <div>

       

        <exercise-in-workout v-bind:exercise = 'exercises[0]'></exercise-in-workout>
        

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
<template>
    <div>
        
        <ul>
            <li v-for='item in exercises' v-bind:key='item.exerciseID'>
                <h3>{{item.name}}</h3>
                <h4>Sets: {{item.sets}}</h4>
                <h4>Reps: {{item.reps}}</h4>
            </li>
        </ul>

         <router-link :to="{ name: 'startworkout', params: {exercises} }" tag='button' class='container' >Start Workout!</router-link> 
         

    </div>
</template>

<script>
export default {
    
    
    props: {
       
        exercises: {type:Array},
        
    },
name: 'workout-exercises',


}
</script>

<style>

</style>

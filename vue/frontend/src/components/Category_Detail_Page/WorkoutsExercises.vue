<template>
    <div>
        
        <div>
            <li v-for='item in exercises' v-bind:key='item.exerciseID' class='exerciseLists'>
                <h3>{{item.name}}</h3>
                <h4>Sets: {{item.sets}}</h4>
                <h4 v-if='item.reps < 15'>Reps: {{item.reps}}</h4>
                <h4 v-if='item.reps > 15'>Reps: {{item.reps}} Seconds</h4>
            </li>
        </div>

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

<style scoped>
.exerciseLists{
    list-style: none;
}
button {
  text-align: center;
  font-size: 14px;
  margin:25px;
  border: none;
  width: 200px;
  background-color: black;
  color: #7ac1ff;
  border-radius: 15px;
  cursor: pointer;
  
}
</style>

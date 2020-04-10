<template>
    <div>
    <div>
        <div class='border'>
        <ul>
            <li v-for='workout in workouts' v-bind:key='workout.workoutID' class='box'>
        
            {{workout.name}} 
             </li>
        </ul>
        </div> 
    </div>
    </div>
</template>

<script>
export default {
    name: 'category-workouts',
    data() {
       return {
        workouts: [],
    }
},
props: {

},
 created() {
    fetch(`${process.env.VUE_APP_REMOTE_API}/api/getWorkouts`)
      .then((response)=>{
        return response.json();
      })
      .then((json)=>{
       this.workouts = json;
       console.log(json);
      })
  }
}

</script>


<style>
.border {
    border: 1px solid black;
}
</style>

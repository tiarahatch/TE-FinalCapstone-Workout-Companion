<template>
  <div>
    <h1>Please browse our premade-workouts</h1>
   <!-- <p>You must be authenticated to see this</p> -->

     <div>
      <ul>
        <li v-for='workout in workouts' v-bind:key='workout.workoutID'>
            {{workout.name}}
            <button v-on:click='displayExercises(workout.workoutID)' v-on:dblclick='hideall'/>
            
              <ul v-bind:id='workout.workoutID' class='hidden'>
              <li v-for='exercise in exercises' v-bind:key='exercise.exerciseID'>
               {{exercise.name}}
               </li> 
            </ul> 
            
            </li>
      </ul>
    </div>
        
  </div>
</template>



<script>
export default {
  name: 'premade-workouts',
 
 data(){
  return{
    workouts: [],
    exercises: [],
   
    

  };
},
methods:{

displayExercises(id) {
   fetch(`${process.env.VUE_APP_REMOTE_API}/api/exercise/${id}`,{
     method: 'GET',
     headers: {
       "Content-Type": "application/json"
     },
   
     
   })
    .then((response)=> {
      if(response.ok) {
        return response.json();
        
        
      } 

    }) 
    .then((json) => {
      this.exercises = json;
    }) 
  let showElements = document.getElementsByClassName('show');
  for (let i = 0; i < showElements.length; i++) {
    showElements[i].className = 'hidden'
  }
  let ul = document.getElementById(id);
  ul.className = 'show'; 
},

hideall() {
  let showElements = document.getElementsByClassName('show');
  for (let i = 0; i < showElements.length; i++) {
    showElements[i].className = 'hidden';
  }
}

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


<style scoped>
.hidden {
  display: none;
}
.show {
  display: block;
}

</style>
<template>
  <div>
    <nav>
      <router-link to='/' tag='button'>Home</router-link>
      </nav>
    <h1 style='text-align: center'>Please Select a Category</h1>
   <!-- <p>You must be authenticated to see this</p> -->

     <div>
      <ul class='container'>

        <li v-for='workout in workouts' v-bind:key='workout.workoutID' class='box'  @mouseover='displayExercises(workout.workoutID);' @mouseleave='hideall'>
            {{workout.name}}  
              <ul v-bind:id='workout.workoutID' class='hidden li'>
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

.border {
  border: 1px solid black;
  margin-top: 2px;
  padding-left: 5px;
}
li {
  list-style: circle;
}

.container{
  margin: 20px auto;
  width:400px;
  height:400px;
  background-color:#fff;
  display:grid;
  grid-template-columns: 200px 200px;
  grid-row: auto auto;
  grid-column-gap: 20px;
  grid-row-gap: 20px;
  
}
  .box{
    background-color:#777;
    color: #7ac1ff;
    padding:20px;
    border-radius:10px;
    display:flex;
    align-items:center;
    justify-content:center;
    
  
  }

.grow { 
  
  transition: all .2s ease-in-out;
  transform: scale(1.1);
 }


</style>

<template>
  <div>
    <nav>
      <router-link to='/' tag='button'>Home</router-link>
      </nav>
    <h1 style='text-align: center'>Please Select a Category</h1>
   <!-- <p>You must be authenticated to see this</p> -->

     <div>
      <ul class='container'>
          <router-link :to="{ name: 'category-details', params: {id: this.id } }" tag='li' class='container'> 
        <li v-for='category in categories' v-bind:key='category.categoryID' class='box' @click='id = category.categoryID'>
          
            {{category.name}} 
             </li>
             <category-workouts v-bind:id = 'this.id' class='hidden'></category-workouts>
              </router-link> 
               
              <!-- <ul v-bind:id='workout.workoutID' class='hidden li'>
              <li v-for='exercise in exercises' v-bind:key='exercise.exerciseID'>
               {{exercise.name}}
               </li> 
            </ul>  -->
            
           
      </ul>
    </div>
        
  </div>
</template>



<script>
import CategoryWorkouts from '@/components/Category_Detail_Page/CategoryWorkouts.vue'
export default {
  name: 'premade-workouts',
 components: {
   CategoryWorkouts,
 },
 data(){
  return{

    workouts: [],
    exercises: [],
    categories: [],
    id: '',
    
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
   fetch(`${process.env.VUE_APP_REMOTE_API}/api/categories`)
      .then((response)=>{
        return response.json();
      })
      .then((json)=>{
       this.categories = json;
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
  list-style-type: none;
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

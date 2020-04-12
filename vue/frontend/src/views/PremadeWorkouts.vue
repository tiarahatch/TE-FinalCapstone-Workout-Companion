<template>
  <div>
    <nav>
       
      <router-link to="/" tag="button">Home</router-link>
      <router-link to="/login" tag="button">Login</router-link>
      <router-link to="/register" tag="button">Sign-Up</router-link>
      <router-link to='/dashboard' tag='button'>Dashboard</router-link>
     <img src="../img/logo.png" alt="Gym logo">

    

      </nav>
    <h1 style='text-align: center'>CHOOSE YOUR WORKOUT</h1>
   <!-- <p>You must be authenticated to see this</p> -->

     <div>
      <ul class='container'>
          <router-link :to="{ name: 'category-details', params: {id: id.toString()} }" tag='li' class='container' > 
        <li v-for='category in categories' v-bind:key='category.categoryID' class='box' @click='id = category.categoryID, setWorkouts(id)'>
            
            {{category.name}} 
             </li>
             
             
              </router-link> 
               <category-workouts v-bind:workoutLists = 'workouts' class='hidden'></category-workouts>
               <category-details v-bind:workoutLists = 'workouts' class='hidden'></category-details>
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
import CategoryDetails from '@/views/CategoryDetails.vue'
export default {
  name: 'premade-workouts',
 components: {
   CategoryWorkouts,
   CategoryDetails,
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
// setWorkouts(id) {
//    fetch(`${process.env.VUE_APP_REMOTE_API}/api/workouts/${id}`,{
//      method: 'GET',
//      headers: {
//        "Content-Type": "application/json"
//      },
//    })
//     .then((response)=> {
     
//         return response.json();
//     }) 
//     .then((json) => {
//       this.workouts = json;
//       console.log(this.workouts)
//     }) 
// }
},

  created() {
   fetch(`${process.env.VUE_APP_REMOTE_API}/api/categories`)
      .then((response)=>{
        return response.json();
      })
      .then((json)=>{
       this.categories = json;
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
button {
   text-align: center;
   font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
  font-size: 14px;
  margin:80px;
  border: none;
  width: 150px;
  background-color: black;
  color: #7ac1ff;
  border-radius: 25px;
}
h1 {
  color:  #7ac1ff;
  justify-content: center;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
}
img {
  width:150px;
  height:150px;
}
template{
  background-color: black;
}

</style>

<template>
  <div>
    
    <div class="table">
      <ul id="horizontal-list">
      <li><router-link to="/schedule" tag="button">Class Schedule</router-link></li>
      <li><router-link to='/dashboard' tag='button'>Dashboard</router-link></li>
      </ul>
      
    </div>
   <!-- <p>You must be authenticated to see this</p> -->

     <div>
       <p style='text-align: center'>CHOOSE YOUR WORKOUT</p>
      
        <router-link :to="{ name: 'category-details', params: {id: id.toString()} }" tag='li' class='container' > 
        <li v-for='category in categories' v-bind:key='category.categoryID' :class='category.name' @click='id = category.categoryID, setWorkouts(id)'>
            
            {{category.name}} 
             </li>
             
             
              </router-link> 
               <category-workouts v-bind:workoutLists = 'workouts' class='hidden'></category-workouts>
               <category-details v-bind:workoutLists = 'workouts' class='hidden'></category-details>
              
            
           
     
    </div>
        
  </div>
</template>



<script>
import auth from '@/auth'
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

},

  created() {
   fetch(`${process.env.VUE_APP_REMOTE_API}/api/categories`,{
     headers: {
       'Authorization': 'Bearer ' + auth.getToken()
     },
   })
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
  justify-content:center;
  
}
  .box{
    background-color:#777;
    color: #c4c6c7;
    padding:20px;
    border-radius:10px;
    display:flex;
    align-items:center;
    justify-content:center;
    background-image: url("../img/Strength.jpeg");
    background-size: cover;
    text-align: center;
  
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
p {
  color:  #7ac1ff;
  justify-content: center;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
}
img {
  width:150px;
  height:150px;
  
}
.table {
	display: table;   /* Allow the centering to work */
	margin: 0 auto;
}
ul#horizontal-list {
min-width: 696px;
	list-style: none;
	padding-top: 20px;
	}
	ul#horizontal-list li {
		display: inline;
	}
  .Strength{
    background-image: url("../img/Strength.jpeg");
    background-size: cover;
    text-align: center;
    background-color:#777;
    color: #7ac1ff;
    padding:20px;
    border-radius:10px;
    display:flex;
    align-items:center;
    justify-content:center;
  
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
  font-size: 30px;
  -webkit-text-stroke: .5px black;
  text-decoration-style: solid;
  text-decoration-color: black;
  }
  .Cardio {
    background-image: url("../img/cardio.jpeg");
    background-size: cover;
    text-align: center;
    background-color:#777;
    color: #7ac1ff;
    padding:20px;
    border-radius:10px;
    display:flex;
    align-items:center;
    justify-content:center;
    font-family: Arial, Helvetica, sans-serif;
    font-weight: bold;
    font-size: 30px;
    -webkit-text-stroke: .5px black;
  text-decoration-style: solid;
  text-decoration-color: black;
  }
   .Flexibility{
  background-image: url("../img/yoga.jpg");
    background-size: cover;
    text-align: center;
     background-color:#777;
    color: #7ac1ff;
    padding:20px;
    border-radius:10px;
    display:flex;
    align-items:center;
    justify-content:center;
    font-family: Arial, Helvetica, sans-serif;
    font-weight: bold;
    font-size: 30px;
    -webkit-text-stroke: .5px black;
  text-decoration-style: solid;
  text-decoration-color: black;
  }
    .Crossfit{
  background-image: url("../img/crossfit.jpeg");
    background-size: cover;
    text-align: center;
    background-color:black;
    color:black;
    border-radius:10px;
    display:flex;
    align-items:center;
    justify-content:center;
    font-family: Arial, Helvetica, sans-serif;
    font-weight: bold;
    font-size: 30px;
    -webkit-text-stroke: .5px black;
  text-decoration-style: solid;
  text-decoration-color: black;
  }
  

</style>

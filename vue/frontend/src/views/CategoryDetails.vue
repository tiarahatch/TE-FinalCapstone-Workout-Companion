<template>
<div id="wholepage">
    <nav>
          <router-link to='/dashboard' tag='button'>My Dashboard</router-link> 
          <router-link to='/premade-workouts' tag='button'>Choose Workout</router-link>
    </nav>

    <div class = "categoryNav">
    <!-- <category-navigation class = "categoryNavigation"></category-navigation> -->
    <category-navigation class = "categoryNavigation" v-on:workoutIdChange="getWorkouts($event)"></category-navigation>
    </div>

    <div class = "mainBody">
    <!-- emit exercises[] from category-workouts -->
    <category-workouts v-bind:id ='this.id' v-bind:workoutLists='this.workouts' v-on:exerciseEmit="exercises=$event" class = "categoryWorkouts" ></category-workouts>
    <!-- push in exercies[] that was pulled from cat-workouts -->
    <workouts-exercises v-bind:exercises = 'exercises' class = "workoutExercises" ></workouts-exercises>
    </div>

</div>
</template>

<script>
import auth from '@/auth'
import CategoryNavigation from '@/components/Category_Detail_Page/CategoryNavigation.vue'
import CategoryWorkouts from '@/components/Category_Detail_Page/CategoryWorkouts.vue'
import WorkoutsExercises from '@/components/Category_Detail_Page/WorkoutsExercises.vue'

export default {

    data(){
        return{

        };
    },
    
    props: {
        id: {type: String},
        workouts: {type:Array},
        exercises: {type:Array},
        
    },
    name: 'category-details',
    components: {
        CategoryNavigation,
        CategoryWorkouts,
        WorkoutsExercises,
        
    },
    created() {
       this.getWorkouts(this.id);
  },
 methods:{
      getWorkouts(id){
      this.id=id;
        this.showExercises = false;

      fetch(`${process.env.VUE_APP_REMOTE_API}/api/workouts/${id}`,{
     method: 'GET',
     headers: {
       'Authorization' : 'Bearer ' + auth.getToken(),
       "Content-Type": "application/json"
     },
   })
    .then((response)=> {
        return response.json();
    }) 
    .then((json) => {
      this.workouts = json;
    }) 
 }
 }

}
</script>

<style>

.mainBody{
    background-color:rgb(211, 211, 211);
    display: flex;
    width: 90%;
    /* height: 100%; */
    margin: auto;
    border-radius: 10px;
    padding-bottom: 5%;
    padding-top:2%;
}

.categoryNavigation{
    /* background-color: blue; */
    width:90%;
    /* height:25%; */
    margin:auto;
    margin-bottom:2%
}

.categoryWorkouts{
    /* background-color: red; */
    /* display: block; */
    width: 30%;

}

.workoutExercises{
    /* background-color: green; */
    width: 70%;
    /* height: auto; */
}


</style>

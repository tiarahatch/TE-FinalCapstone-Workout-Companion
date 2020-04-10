<template>
    <div>
        <nav>
          <router-link to='/' tag='button'>Home</router-link>  
        </nav>
    <div>
        <ul class='container'>
            <li v-for='workout in workouts' v-bind:key='workout.workoutID' class='box'>
        
            {{workout.name}} 
             </li>
        </ul>
        </div>
    </div>
</template>

<script>
export default {
name: 'category-navigation',
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

<style scoped>
.container{
  display: flex;
  align-items: center;
  justify-content: center;
  width: 87%;
  margin: auto;
  
  
}
  .box{
    background-color:#777;
    color: #7ac1ff;
    width: 20%;
    margin: 2%;
    padding: 40px;
    border-radius:10px;
    border-width: 100%;
    display:block;
    align-items:center;
    justify-content:center;
    text-align: center;
    
    
  
  }
</style>

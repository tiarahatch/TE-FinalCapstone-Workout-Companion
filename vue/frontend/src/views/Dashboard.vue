<template>

<div id="wholepage">
    <div class='navButtons'>
    <button v-on:click='logout'> LogOut</button>
    </div>
      <h1>MY DASHBOARD</h1>
    <h2>Welcome Back</h2>
    <div class='side'>
        <router-link to='/category-details' tag='button'>Choose Workout</router-link><br>
        <router-link to='/schedule' tag='button'>Sign Up for Class</router-link><br>
        <router-link to='/NewUser' tag='button'>Edit Profile</router-link><br>
        <button>My Metrics</button><br>
        
        </div>

    <div class='images'>
        <img src='../img/motivation.jpg' class='quote'><br>
       
    </div>
  <category-percentage id='Doughnut'></category-percentage>
  <workout-consistancy id='line'></workout-consistancy>
</div>
</template>


<script>
import auth from '@/auth'
import CategoryPercentage from '@/components/PieChart.vue'
import WorkoutConsistancy from '@/components/LineChart.vue'
export default {
  components: {
      CategoryPercentage,
      WorkoutConsistancy
  },
methods: {
    logout() {
        auth.logout();
        localStorage.removeItem('Authorization');
        this.$router.go('/')
  },
}
}
    </script>
 

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Black+Ops+One&display=swap');

@import url('https://fonts.googleapis.com/css2?family=Oswald&display=swap');

.side button {
 position: absolute;
    top: 100px;
    left: 200px;
    right:300px;
    margin: auto;
       
}
#wholepage{
    padding:0;
    margin:0;
    width:100%;
    min-height:100vh;
    background-image: url('../img/workoutBackground4.png');

}
button {
 text-align: center;
  font-size: 100%;
  border: none;
  height: 25%;
  width: 35%;
  background-color: rgba(0, 0, 0, 0.5);
  color: white;
  border-radius: 8px;
  transition: 0.6s;
  margin: 10px;
}
button:hover {
height: 30%;
  width: 35%;
  cursor: pointer;
  background-color: rgba(0, 0, 0, 0.75);
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19); 
 }
h1 {
    text-align: center;
    font-family: 'Black Ops One';
    color: white;
    
}
h2 {
    text-align: center;
    font-family: 'Black Ops One';
    color: white;
  
    margin: 10px;
}
.quote {
    position: absolute;
    top: 100px;
    right: 300px;
    border-radius: 5px;
    
}
.piechart {
    border-radius: 4px;
    position:absolute;
    padding: 5px;
    width: 100px;
    margin: auto;
    right: 650px;
    top: 220px;


}

#Doughnut {
    position: absolute;
    top: 16%;
    right: 36%;
    height: 35%;
}
  #line {
      position: absolute;
      height: 40%;
      width: 95%;
      top: 60%;
      left: 3%;
  }
 .navButtons{
    display:flex;
    justify-content: flex-end;
    margin-bottom:1%;
    
}
.navButtons button{
    width: 10%;
    height: 30px; 
    background-color: rgba(0, 0, 0, 0.5);
    color:white;
    font-family: 'Oswald', sans-serif;
    border: none;
    transition: .6s;
}

.navButtons button:hover {
  width: 12%;
  height: 30px;
  cursor: pointer;
  background-color: rgba(0, 0, 0, 0.75);
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}

</style>

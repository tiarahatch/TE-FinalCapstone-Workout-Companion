<template>

<div id="wholepage">
    <h1>MY DASHBOARD</h1>
    <h2>Welcome Back</h2>
    <div class='side'>
        <router-link to='/category-details' tag='button'>Choose Workout</router-link><br>
        <router-link to='/schedule' tag='button'>Sign Up for Class</router-link><br>
        <router-link to='/NewUser' tag='button'>Edit Profile</router-link><br>
        <button>My Metrics</button><br>
        <button v-on:click='logout'> LogOut</button>
        </div>

    <div class='images'>
        <img src='../img/motivation.jpg' class='quote'><br>
        <img src='../img/piechart.png' class='piechart'>
    </div>
    

</div>
</template>


<script>
import auth from '@/auth'

export default {
  
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

.side {
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
h1{
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


  
</style>

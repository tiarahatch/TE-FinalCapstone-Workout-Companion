<template>

<div>
    
        <h1>Welcome back: FirstName LastName</h1>
     <div class='side'>
        <router-link to='/premade-workouts' tag='button'>Choose Workout</router-link><br>
        <router-link to='/schedule' tag='button'>Sign Up for Class</router-link><br>
        <router-link to='/NewUser' tag='button'>Edit Profile</router-link><br>
        <button>My Metrics</button><br>
        <button v-on:click='logout'> LogOut</button>
    </div>

    <div class='motivational-image'>
        <img src='../img/motivation.jpg'>
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

.side {
 position: absolute;
    top: 100px;
    left: 300px;
       
}
button {
  text-align: center;
  font-size: 14px;
  margin:25px;
  border: none;
  width: 200px;
  background-color: black;
  color: #7ac1ff;
  border-radius: 15px;
  cursor: pointer;
}
h1{
    text-align: center;
    color: #7ac1ff;
    text-decoration: underline overline; 
}
.motivational-image {
    position: absolute;
    top: 100px;
    right: 300px;
    border-radius: 5px;
    
}


  
</style>

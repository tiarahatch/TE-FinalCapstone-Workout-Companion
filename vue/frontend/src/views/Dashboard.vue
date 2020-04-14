<template>

    <div>
        <h1>Welcome back: FirstName LastName</h1>
     <nav>
      <router-link to='/' tag='button'>Home</router-link><br>
      <router-link to='/premade-workouts' tag='button'>Choose Workout</router-link><br>
      <router-link to='/schedule' tag='button'>Sign Up for Class</router-link><br>
      <router-link to='/NewUser' tag='button'>Edit Profile</router-link><br>
      <button v-on:click='logout'> LogOut</button>
      
      </nav>
    <form action="/action_page.php">
        <label for="img">Upload Profile Picture: </label><br>

        <input type="file" id="img" name="img" accept="image/*"><br>

        <input type="submit">
    </form>
    <div id="piechart"></div>
    
          

          
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
}


  
</style>

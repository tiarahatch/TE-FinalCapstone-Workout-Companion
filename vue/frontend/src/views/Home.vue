<template>

  <div class="home">
    

      <router-link to='/register' tag='button'>Sign Up</router-link>
      <router-link to='/login' tag='button'>Login</router-link>
      <p> HSG FITNESS. WHERE YOU TURN FAT INTO FINE! </p>
       <h1>
   <router-link to='/premade-workouts' tag='button'>Our Workouts</router-link>
    <router-link to='/schedule' tag='button'>View Class Schedule</router-link>
  </h1> 
      <img src="../img/logo.png" alt="Gym logo">
    

    
    <div class="fullscreen-bg">>
      <!-- <img src ="../img/workout.jpeg"> -->
      <video playsinline autoplay muted loop poster="polina.jpg" id="bgvid">
        <source src="../img/clip.webm" type="video/webm">
      </video>
     <header class="viewport-header">
       <div class="container">
     <p>Welcome to our Gym!</p>
      
       </div> 
  <!-- <h1>
   <router-link to='/premade-workouts' tag='button'>Our Workouts</router-link>
    <router-link to='/schedule' tag='button'>View Class Schedule</router-link>
  </h1>  -->
</header> 
  </div> 
  </div>
    
</template>

<script>
export default {
  name: 'home'
}
</script>


<style scoped>

div {
  text-align: center;
}
router-link {
  position: fixed;
  height: 10px;
  width: 100%;
}
.fullscreen-bg{
  position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    overflow: hidden;
    z-index: -100;
}
.fullscreen-bg video {
  position: fixed;
  size: cover;
    top: 0;
    left: 0;
    width: 100%;
    height: auto;
}
.container {
  position: absolute;
  margin: 20px;
  width: auto;
}
.viewport-header {
  position: relative;
  height: 100vh;
  text-align: center;
  display: flex;
  align-items: center;
  justify-content: center;
}
button {
  text-align: center;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
  border-radius: 25px;
  font-size: 14px;
  margin:95px;
  border: none;
  width: 200px;
  background-color: black;
  color: #7ac1ff;
  
}
.topnav {
  overflow: hidden;
}
.topnav router-link{
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
}
img {
  width:128px;
  height:128px;
  justify-content: center;
  position:sticky;
  outline-color: #7ac1ff;
}
p {
  color: #7ac1ff;
  justify-content: center;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
}

</style>
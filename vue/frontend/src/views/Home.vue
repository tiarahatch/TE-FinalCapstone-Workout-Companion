<template>

  <div class="home">
    <div class="topnav">
      <router-link to='/premade-workouts'>Sign Up</router-link>
      <router-link to='/login'>Login</router-link>
    </div>
    <div class="fullscreen-bg">>
      <!-- <img src ="../img/workout.jpeg"> -->
      <video playsinline autoplay muted loop poster="polina.jpg" id="bgvid">
        <source src="../img/clip.mp4" type="video/mp4">
      </video>
     <header class="viewport-header">
       <div class="container">
     
      
      </div> 
  <h1>
   <router-link to='/premade-workouts' tag='button'>Our Workouts</router-link>
    <router-link to='/schedule' tag='button'>View Schedule</router-link>
  </h1> 
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
  font-size: 28px;
  margin:105px;
  border: 2px solid gray;
  width: 250px;
  background-color: black;
  color: white;
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
}

</style>
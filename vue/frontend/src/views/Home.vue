<template>
<body>
  <div class="home">
    <nav>
      <h1> H.S.G FITNESS</h1><br>
      <p> WHERE YOU TURN FAT INTO FINE!!! </p>
      
    
</nav>
  
    
    <div class="fullscreen-bg">>
      <!-- <img src ="../img/workout.jpeg"> -->
      <img src="../img/lift.jpg" alt="Gym">
     <header class="viewport-header">
       <div class="container">
      
      
      </div> 
  
   
    <router-link to='/schedule' tag='button'>View Class Schedule</router-link><br>
    <router-link to='/register' tag='button'>Sign Up</router-link><br>
    <router-link to='/dashboard' tag='button'>My Dashboard</router-link>
    
  
</header> 
  </div>
  </div>
    </body>
</template>

<script>
export default {
  name: 'home'
}
</script>


<style scoped>
 img{
  size: cover;
}
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
.fullscreen-bg img {
  position: fixed;
  size: cover;
    top: 0;
    left: 0;
    width: 100%;
    height: auto;
}
h1, p{
  color: #7ac1ff;
  font-size: 50px;
  font-family: sans-serif, "Helvetica Neue", "Lucida Grande", Arial;
  font-stretch: expanded;
  -webkit-text-stroke: 3px black;
  text-decoration-style: solid;
  text-decoration-color: black;
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
  font-size: 14px;
  margin:25px;
  border: none;
  width: 200px;
  background-color: black;
  color: #7ac1ff;
  border-radius: 15px;
  cursor: pointer;
  
}
button:hover span {
  padding-right: 25px;
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
img {
  width:128px;
  height:128px;
  background-color: none;
  
}

</style>
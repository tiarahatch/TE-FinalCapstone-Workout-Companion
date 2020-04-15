<template>
<body>
    
  <div class="home">
    
    <div class="welcome">
      <h1 id="logoText">H.S.G. FITNESS</h1>
      <p id='tagLine1'> Join today so we can help you</p>
      <p id='tagLine2'>TURN FAT INTO FINE!</p>
    </div>

    <div class="pageLinks">
      
      <!-- <img src ="../img/workout.jpeg"> -->
      <!-- <img src="../img/lift.jpg" alt="Gym" /> -->

        <router-link to="/schedule" tag="button">View Class Schedule</router-link>
        <br />
        <router-link to="/register" tag="button">Sign Up</router-link>
        <br />
        <router-link to="/dashboard" tag="button">My Dashboard</router-link>
        <br />
        <button v-on:click='logout'> LogOut</button>

      </div>
      
       <div class="cb-slideshow">
        <li>
          <span></span>
        </li>
        <li>
          <span></span>
        </li>
        <li>
          <span></span>
        </li>
      </div>
    
  </div>
</body>
</template>

<script>
import auth from '@/auth'
export default {
  name: "home"
,
methods: {
    logout() {
        auth.logout();
        localStorage.removeItem('Authorization');
        this.$router.go('/')
  }
}
}

</script>


<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Black+Ops+One&display=swap');

@import url('https://fonts.googleapis.com/css2?family=Oswald&display=swap');

/* * { 
  font-family: 'Oswald', sans-serif;
  font-family: 'Black Ops One';
} */

.topnav {
  overflow: hidden;
  background-color: #333;
}
 .home{
   display: flex;
   justify-content: center;
   align-items: center;
  
 }

.welcome{
  font-family: 'Black Ops One';
  position: fixed;
  width: 90%;
  text-align:center;
  z-index: 1000;
  color: #045499;
  font-size: 250%;
  -webkit-text-stroke: 1px rgb(226, 226, 226);
  top: 35%;
  left: 50%;
  transform: translate(-50%, -50%);
}
#logoText{
  /* font-family: 'Oswald', sans-serif; */
  font-style: italic;
  
  margin-bottom: 0;
}
#tagLine1{
  font-family: 'Oswald', sans-serif;
  font-size: 200%;
  margin-bottom: 0;
  margin-top: 0;
  background-image: radial-gradient(rgba(0, 0, 0, 0.849),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));  

}
#tagLine2{
  /* font-family: 'Oswald', sans-serif; */
  margin-bottom: 0;
}

 .pageLinks {
  display: flex;
  justify-content: space-around;
  position: absolute;
  height:12%;
  width: 90%;
  z-index: 1000;
  margin: auto;
  align-items: center;
  position: fixed;
  top: 65%;
  left: 50%;
 font-family: 'Oswald', sans-serif;

  transform: translate(-50%, -50%);

}
.pageLinks button{
  background-color: rgba(126, 126, 126,.5);
  height: 75%;
  width: 25%;
  opacity: .8;
  font-size: 125%;
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
  border: none;
  transition-duration: 0.6s;
   color: white;
  /* -webkit-text-stroke: 1px rgb(97, 97, 97); */

}
.pageLinks button:hover{
  opacity: .9;
  width:30%;
  background-color: rgb(177, 177, 177);
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}

.cb-slideshow { 
    opacity: .85;
    background-color: black;
    position: fixed;
    width: 100%;
    height: 100%;
    top: 0px;
    left: 0px;
    z-index: 0; 
}
.cb-slideshow li span { 

    width: 100%;
    height: 100%;
    position: absolute;
    top: 0px;
    left: 0px;
    color: transparent;
    background-size: cover;
    background-position: 50% 50%;
    background-repeat: none;
    opacity: 0;
    z-index: 0;
    animation: imageAnimation 36s linear infinite 0s; 
}
.cb-slideshow li:nth-child(1) span { 
    background-image: url(../img/lift.jpg);
    background-color: black; 
}
.cb-slideshow li:nth-child(2) span { 
    background-image: url(../img/BackgroundImages/homeBackground4.jpg);
    background-color: black; 
    animation-delay: 12s; 
}
.cb-slideshow li:nth-child(3) span { 
    background-image: url(../img/BackgroundImages/homeBackground5.jpg);
    background-color: black; 
    animation-delay: 24s; 
}
.cb-slideshow li:nth-child(2) div { 
    animation-delay: 12s; 
}
.cb-slideshow li:nth-child(3) div { 
    animation-delay: 24s; 
}
@keyframes imageAnimation { 
    0% { opacity: 0; animation-timing-function: ease-in; }
    8% { opacity: 1; animation-timing-function: ease-out; }
    17% { opacity: 1 }
    40% { opacity: 0 }
    100% { opacity: 0 }
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}

</style>
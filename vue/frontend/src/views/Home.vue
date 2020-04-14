<template>
<body>
  <div class="home">
    
    <div class="welcome">
      <h1>H.S.G FITNESS</h1>

      <p>WHERE YOU TURN FAT INTO FINE!!!</p>
    </div>

    <div class="pageLinks">
      
      <!-- <img src ="../img/workout.jpeg"> -->
      <!-- <img src="../img/lift.jpg" alt="Gym" /> -->

        <router-link to="/schedule" tag="button">View Class Schedule</router-link>
        <br />
        <router-link to="/register" tag="button">Sign Up</router-link>
        <br />
        <router-link to="/dashboard" tag="button">My Dashboard</router-link>

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
export default {
  name: "home"
};
</script>


<style scoped>
 .home{
   display: flex;
   justify-content: center;
   align-items: center;
  
 }

.welcome{
  position: fixed;
  width: 90%;
  text-align:center;
  z-index: 1000;
  color: #7ac1ff;
  font-size: 250%;
  font-family: sans-serif, "Helvetica Neue", "Lucida Grande", Arial;
  font-stretch: expanded;
  -webkit-text-stroke: 3px black;
  text-decoration-style: solid;
  text-decoration-color: black;
  top: 35%;
  left: 50%;
  transform: translate(-50%, -50%);
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
 

  transform: translate(-50%, -50%);

}
.pageLinks button{
  background-color: rgb(126, 126, 126);
  height: 75%;
  width: 25%;
  opacity: .6;
  font-size: 125%;
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
  border: none;
  transition-duration: 0.5s;
   color: white;
  /* -webkit-text-stroke: 1px rgb(97, 97, 97); */

}
.pageLinks button:hover{
  opacity: .9;
  background-color: rgb(177, 177, 177);
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}

.cb-slideshow { 
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
    animation: imageAnimation 18s linear infinite 0s; 
}
.cb-slideshow li:nth-child(1) span { 
    background-image: url(../img/lift.jpg); 
}
.cb-slideshow li:nth-child(2) span { 
    background-image: url(../img/BackgroundImages/homeBackground2.jpg);
    animation-delay: 6s; 
}
.cb-slideshow li:nth-child(3) span { 
    background-image: url(../img/BackgroundImages/homeBackground3.jpg);
    animation-delay: 12s; 
}
.cb-slideshow li:nth-child(2) div { 
    animation-delay: 6s; 
}
.cb-slideshow li:nth-child(3) div { 
    animation-delay: 12s; 
}
@keyframes imageAnimation { 
    0% { opacity: 0; animation-timing-function: ease-in; }
    8% { opacity: 1; animation-timing-function: ease-out; }
    17% { opacity: 1 }
    40% { opacity: 0 }
    100% { opacity: 0 }
}

/* router-link {
  position: fixed;
  height: 10px;
  width: 100%;
} */

/* .fullscreen-bg img {
  position: fixed;
  size: cover;
  top: 0;
  left: 0;
  width: 100%;
  height: auto;
  animation-delay: 6s;
}  */

/* h1,
p {
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
  margin: 25px;
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
.topnav router-link {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
} */

</style>
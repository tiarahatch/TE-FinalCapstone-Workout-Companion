<template>
<body>
    <div class='navButtons'>
      
      <router-link v-if="loggedIn" to="/dashboard" tag="button">My Dashboard</router-link>
      <button v-if="loggedIn" v-on:click='logout'> LogOut</button>
      <router-link v-if="!loggedIn" to="/login" tag="button">Login</router-link>
      

      </div>
  
  
  <div class="home">
    <div class="container">
      <div class='welcome'>
      <h1 id="logoText">H.S.G. FITNESS</h1>
      <p id='tagLine1'> Join today so we can help you</p>
      <p id='tagLine2'>TURN FAT INTO FINE!</p>
      </div>
   

    <div class='signup'>
      


        <router-link to="/register" tag="button">Sign Up!</router-link>
        <br />
    </div>
    <div class='view-schedule'>
        <router-link to="/schedule" tag="button">View Class Schedule</router-link>
        <br />
    </div>
         </div>

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
    
  
</body>
</template>

<script>
import auth from "@/auth";

export default {
  name: "home",
  computed:{
    loggedIn(){
    return auth.loggedIn();

    }
  
  },
  methods: {
    logout() {
      auth.logout();
      localStorage.removeItem("Authorization");
      this.$router.go("/");
    }
  }
};

</script>


<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Black+Ops+One&display=swap");

@import url("https://fonts.googleapis.com/css2?family=Oswald&display=swap");

/* * { 
  font-family: 'Oswald', sans-serif;
  font-family: 'Black Ops One';
} */

.home {
  display: flex;
  justify-content: center;
  align-items: center;
}

.welcome {
  font-family: "Black Ops One";
  position: fixed;
  width: 90%;
  text-align: center;
  z-index: 1000;
  color: #045499;
  font-size: 250%;
  -webkit-text-stroke: 1px rgb(226, 226, 226);
  top: 35%;
  left: 50%;
  transform: translate(-50%, -50%);
}
.container {
  display: flex;
  flex-direction: column;
}
#logoText {
  /* font-family: 'Oswald', sans-serif; */
  font-style: italic;
  margin-bottom: 0;
  background-image: radial-gradient(
    rgba(0, 0, 0, 0.75),
    rgba(0, 0, 0, 0.2),
    rgba(0, 0, 0, 0),
    rgba(0, 0, 0, 0)
  );
}
#tagLine1 {
  font-family: "Oswald", sans-serif;
  font-size: 200%;
  margin-bottom: 0;
  margin-top: 0;
  background-image: radial-gradient(
    rgba(0, 0, 0, 0.75),
    rgba(0, 0, 0, 0.2),
    rgba(0, 0, 0, 0),
    rgba(0, 0, 0, 0)
  );
}
#tagLine2 {
  /* font-family: 'Oswald', sans-serif; */
  margin-bottom: 0;
  background-image: radial-gradient(
    rgba(0, 0, 0, 0.75),
    rgba(0, 0, 0, 0.2),
    rgba(0, 0, 0, 0),
    rgba(0, 0, 0, 0)
  );
}

.signup {
  display: flex;
  justify-content: space-around;
  flex-direction: column;
  position: absolute;
  top: 65%;
  left: 50%;
  height: 12%;
  width: 90%;
  z-index: 1000;
  margin: auto;
  align-items: center;
  position: fixed;
  font-family: "Oswald", sans-serif;

  transform: translate(-50%, -50%);
}
.signup button {
  background-color: rgba(126, 126, 126, 0.5);
  height: 75%;
  width: 30%;
  opacity: 0.8;
  font-size: 125%;
  box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  border: none;
  transition-duration: 0.6s;
  color: white;
  position: inherit;
  /* -webkit-text-stroke: 1px rgb(97, 97, 97); */
}
.signup button:hover {
  opacity: 0.9;
  width: 33%;
  background-color: rgb(177, 177, 177);
  box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);
}

.view-schedule {
  display: flex;
  justify-content: space-around;
  flex-direction: column;
  position: absolute;
  height: 9%;
  width: 80%;
  z-index: 1000;
  margin: auto;
  align-items: center;
  position: fixed;
  top: 80%;
  left: 50%;
  font-family: "Oswald", sans-serif;

  transform: translate(-50%, -50%);
}
.view-schedule button {
  background-color: rgba(126, 126, 126, 0.5);
  height: 75%;
  width: 30%;
  opacity: 0.8;
  font-size: 125%;
  box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  border: none;
  transition-duration: 0.6s;
  color: white;
  position: inherit;
  /* -webkit-text-stroke: 1px rgb(97, 97, 97); */
}
.view-schedule button:hover {
  opacity: 0.9;
  width: 33%;
  background-color: rgb(177, 177, 177);
  box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);
}

.cb-slideshow {
  opacity: 0.85;
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
  filter: grayscale(85%);
  background-color: black;
}
.cb-slideshow li:nth-child(2) span {
  background-image: url(../img/BackgroundImages/homeBackground4.jpg);
  filter: grayscale(85%);
  background-color: black;
  animation-delay: 12s;
}
.cb-slideshow li:nth-child(3) span {
  background-image: url(../img/BackgroundImages/homeBackground5.jpg);
  filter: grayscale(85%);
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
  0% {
    opacity: 0;
    animation-timing-function: ease-in;
  }
  8% {
    opacity: 1;
    animation-timing-function: ease-out;
  }
  17% {
    opacity: 1;
  }
  40% {
    opacity: 0;
  }
  100% {
    opacity: 0;
  }
}

.navButtons {
  display: flex;
  justify-content: flex-end;
  margin-bottom: 1%;
}
.navButtons button {
  width: 12%;
  height: 50px;
  background-color: rgba(126, 126, 126, 0.5);
  color: white;
  font-family: "Oswald", sans-serif;
  border: none;
  transition: 0.6s;
  z-index: 1000;
  font-size: 100%;
}

.navButtons button:hover {
  cursor: pointer;
  background-color: rgb(177, 177, 177);
  box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);
}
</style>
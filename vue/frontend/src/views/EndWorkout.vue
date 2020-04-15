<template>
  <div id="wholepage">
    <nav class="navButtons">
      <router-link to="/dashboard" tag="button">My Dashboard</router-link>
      <button v-on:click="logout">LogOut</button>
    </nav>
    <div class="meter">
      <span style="width: 100%"></span>
    </div>
    <div>
      <h1>WORKOUT COMPLETE!!</h1>

    </div>
    <h1>How do you feel after your workout?</h1>
    <div class="feelingForm">
    
    <div class="smileyFaces">
     
      <div>
        <input v-on:click="selected = true" type="radio" id="circle1" name="choice" value="1" class="input-hidden"/>
        <label for="circle1">
          <img class="circle1" src="../img/feeling1.png" />
        </label>
      </div>

      <div>
        <input v-on:click="selected = true" type="radio" id="circle2" name="choice"  value="2" class="input-hidden" />
        <label for="circle2">
          <img class="circle2" src="../img/feeling2.png" />
        </label>
      </div>

      <div>
        <input v-on:click="selected = true" type="radio" id="circle3" name="choice" value="3" class="input-hidden"/>
        <label for="circle3">
          <img class="circle3" src="../img/feeling3.png" />
        </label>
      </div>

      <div>
        <input v-on:click="selected = true" type="radio" id="circle4" name="choice" value="4"  class="input-hidden" />
        <label for="circle4">
          <img class="circle4" src="../img/feeling4.png" />
        </label>
      </div>

      <div>
        <input v-on:click="selected = true" type="radio" id="circle5" name="choice"  value="5" class="input-hidden"/>
        <label for="circle5">
          <img class="circle5" src="../img/feeling5.png" />
        </label>
      </div>

    </div>

      <div>
      
      <img id="inspGif" src="../img/gif.gif" alt="gif" />
    </div>

     <div id="start-workout" class="not-selected" :class="selected && 'chosen' ">
      <router-link to="/dashboard" tag="button" :disabled="selected == false" id="start" >
        Finish Workout!
      </router-link>
    </div>

    </div>

  </div>
</template>

<script>
import auth from "@/auth";

export default {
  props: {
    exercises: []
  },
  data() {
    return {
      selected: false
    };
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
#inspGif{
  width:25%;
  margin-top:5%;
}

.feelingForm{
  background-color:rgb(211, 211, 211);
  margin:auto;
  border-radius: 10px;
  padding-top: 2%;
  padding-bottom: 2%;
  width: 90%;
  margin-bottom:5%;
}

#feelingCheckbox {
  text-align: center;
  vertical-align: middle;
}
h1 {
  font-family: "Black Ops One";
  text-align: center;
  color: white;
  -webkit-text-stroke: 1px black;
}
.smileyFaces {
  /* background-color:red; */
  display: flex;
  justify-content: space-around;
  width: 60%;
  margin: auto;
}

.circle1 {
  height: 50px;
  width: 50px;
  background-color: rgb(243, 115, 115);
  border-radius: 50%;
}
.circle2 {
  height: 50px;
  width: 50px;
  background-color: rgb(248, 178, 113);
  border-radius: 50%;
}

.circle3 {
  height: 50px;
  width: 50px;
  background-color: rgb(245, 243, 132);
  border-radius: 50%;
}
.circle4 {
  height: 50px;
  width: 50px;
  background-color: rgb(176, 245, 87);
  border-radius: 50%;
}
.circle5 {
  height: 50px;
  width: 50px;
  background-color: rgb(36, 247, 46);
  border-radius: 50%;
}

input[type="radio"]:checked + label > img {
  border: 3px solid rgba(11, 157, 241, 0.863);
  transform: scale(1.3);
}
input[type="radio"]:not(:checked) + label > img {
  opacity: 50%;
}
.input-hidden {
  position: absolute;
  left: -9999px;
}
#start-workout {
  text-align: center;
  margin-left: auto;
  margin-right:auto;
  display: block;
  margin-top: 4%;
}
#start {
  background-color: rgba(0, 0, 0, 0.5);
  padding-top: 1.2%;
  padding-bottom: 1.2%;
  padding-left: 7%;
  padding-right: 7%;
  font-size: 20px;
  cursor: pointer;
  border-radius: 8px;
  color:white;
  font-family: "Oswald", sans-serif;

  transition: 0.8s;
}
.not-selected {
  opacity: 30%;
}
.chosen {
  opacity: 100%;
}
img {
  display: block;
  margin-left: auto;
  margin-right: auto;
  border-radius: 10px;
}

.chosen #start:hover {
  background-color: rgba(0, 0, 0, 0.75);
  box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);
  border:none;
}

.meter {
  height: 10px; /* Can be anything */
  width: 50%;
  margin: auto;
  align-items: center;
  background: blue;
  -moz-border-radius: 25px;
  -webkit-border-radius: 25px;
  border-radius: 25px;
}
.meter > span {
  display: block;
  height: 100%;
  border-top-right-radius: 8px;
  border-bottom-right-radius: 8px;
  border-top-left-radius: 20px;
  border-bottom-left-radius: 20px;
  background-color: rgb(36, 247, 46);
  background-image: linear-gradient(
    center bottom,
    rgb(43, 194, 83) 37%,
    rgb(84, 240, 84) 69%
  );
  box-shadow: inset 0 2px 9px rgba(255, 255, 255, 0.3),
    inset 0 -2px 6px rgba(0, 0, 0, 0.4);
  position: relative;
  overflow: hidden;
}
#wholepage {
  padding: 0;
  margin: 0;
  width: 100%;
  min-height: 110vh;
  background-image: url("../img/workoutBackground4.png");
}

.navButtons {
  display: flex;
  justify-content: flex-end;
  margin-bottom: 1%;
}
.navButtons button {
  width: 10%;
  height: 30px;
  background-color: rgba(0, 0, 0, 0.5);
  color: white;
  font-family: "Oswald", sans-serif;
  border: none;
  transition: 0.6s;
}

.navButtons button:hover {
  width: 12%;
  height: 30px;
  cursor: pointer;
  background-color: rgba(0, 0, 0, 0.75);
  box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);
}


</style>

<template>
  <div id="wholepage">
    
    
     <div class='navButtons'>

          <router-link to='/category-details' tag='button'>Change Workout</router-link> 
          <router-link to='/dashboard' tag='button'>My Dashboard</router-link> 
          <button v-on:click='logout'> LogOut</button>

    </div>

    <h1>How do you feel pre-workout?</h1>
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

    <div id="start-workout" class="not-selected" :class="selected && 'chosen' ">
      <router-link :to="{ name: 'workoutMain', params: {exercises} }" :disabled="selected == false" id="start" tag="button">
        Start Workout!
      </router-link>
    </div>
   
   </div>

  </div>
</template>

<script>
import auth from "@/auth"
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
        localStorage.removeItem('Authorization');
        this.$router.go('/')
  }
  }
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Oswald&display=swap");
@import url('https://fonts.googleapis.com/css2?family=Black+Ops+One&display=swap');


#wholepage {
  padding: 0;
  margin: 0;
  width: 100%;
  min-height: 100vh;
  background-image: url("../img/workoutBackground4.png");
}
.feelingForm{
  background-color:rgb(211, 211, 211);
  margin:auto;
  border-radius: 10px;
  padding-top: 5%;
  padding-bottom: 5%;
  width: 90%;
}
#feelingCheckbox {
  text-align: center;
  vertical-align: middle;
}
h1 {
  font-family: 'Black Ops One';
  text-align: center;
  color:white;
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
  transition: .3s;
}
.circle2 {
  height: 50px;
  width: 50px;
  background-color: rgb(248, 178, 113);
  border-radius: 50%;
  transition: .3s;
}

.circle3 {
  height: 50px;
  width: 50px;
  background-color: rgb(245, 243, 132);
  border-radius: 50%;
  transition: .3s;
}
.circle4 {
  height: 50px;
  width: 50px;
  background-color: rgb(176, 245, 87);
  border-radius: 50%;
  transition: .3s;
}
.circle5 {
  height: 50px;
  width: 50px;
  background-color: rgb(36, 247, 46);
  border-radius: 50%;
  transition: .3s;
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
  margin: auto;
  display: block;
  margin-top: 10%;
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
  border:none;
}
.chosen #start:hover {
  background-color: rgba(0, 0, 0, 0.75);
  box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);
  border:none;
}
.navButtons{
    display:flex;
    justify-content: flex-end;
    margin-bottom:1%;
    
}
.navButtons button{
    width: 10%;
    height: 30px; 
    background-color: rgba(0, 0, 0, 0.5);
    color:white;
    font-family: 'Oswald', sans-serif;
    border: none;
    transition: .6s;
}

.navButtons button:hover {
  width: 12%;
  height: 30px;
  cursor: pointer;
  background-color: rgba(0, 0, 0, 0.75);
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}

</style>

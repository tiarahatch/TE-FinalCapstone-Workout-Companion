<template>
    <div>
        <router-link to='/Dashboard' tag='button'>Punk Out?!</router-link><br>

        <h1> How do you feel pre-workout?</h1>
        <div class='howYouFeel'>
          
        <div>
         
          <input  v-on:click="selected = true" type="radio" id="circle1" name="choice" value="1" class='input-hidden'/>
            <label for='circle1'>
          <img class="circle1" src="../img/feeling1.png">
          </label>
          </div> 
       <div>
           
          <input v-on:click="selected = true" type="radio" id="circle2" name="choice" value="2" class='input-hidden'/>
          <label for='circle2'>
          <img class="circle2" src="../img/feeling2.png">
          </label>
          </div> 
        <div>
           
          <input  v-on:click="selected = true" type="radio" id="circle3" name="choice" value="3" class='input-hidden'/>
          <label for='circle3'>
          <img class="circle3" src="../img/feeling3.png">
          </label>
          </div> 
        <div>
          
          <input  v-on:click="selected = true" type="radio" id="circle4" name="choice" value="4" class='input-hidden'/>
           <label for='circle4'>
          <img class="circle4" src="../img/feeling4.png">
          </label>
          </div> 
       <div>
           
          <input  v-on:click="selected = true" type="radio" id="circle5" name="choice" value="5" class='input-hidden'/>
          <label for='circle5'>
          <img class="circle5" src="../img/feeling5.png">
          </label>
          </div> 
        </div>
     <nav>
      
      </nav>
      <div id='start-workout' class='not-selected' :class='selected && "chosen"'> 
        <router-link to='/dashboard' :disabled='selected == false' id='start' tag='button'>Start Workout!</router-link>
      </div>
      </div>
</template>

<script>
export default {

props:{
    exercises:[]
},
data() {
  return {
    selected: false
  }
},
methods: {

}

}
</script>

<style scoped>
#feelingCheckbox{
 text-align: center;
 vertical-align: middle;
  
}
h1 {
    text-align: center;
}
.howYouFeel{
    display:flex;
    justify-content: space-around;
    width: 60%;
    margin:auto;
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

input[type=radio]:checked + label>img {
    border: 3px solid rgba(11, 157, 241, 0.863);
  transform: scale(1.3)
}
input[type=radio]:not(:checked) + label>img {
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
  padding-top: 1.2%;
  padding-bottom: 1.2%;
  padding-left: 7%;
  padding-right: 7%;
   font-size: 20px;

}
.not-selected {
  opacity: 30%;
}
.chosen {
  opacity: 100%;
}
</style>

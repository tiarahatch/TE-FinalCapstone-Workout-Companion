<template>
    <div>
        <router-link to='/Dashboard' tag='button'>Punk Out?!</router-link><br>

        <h1> How do you feel pre-workout?</h1>
        <div class='howYouFeel'>
        <div class="circle1">
          <img class="circle1" src="../img/feeling1.png">
          <input id="feelingCheckbox" type='checkbox'/>
          </div> 
        <div class="circle2">
          <img class="circle2" src="../img/feeling2.png">
          <input id="feelingCheckbox" type='checkbox'/>
        </div>
        <div class="circle3">
          <img class="circle3" src="../img/feeling3.png">
          <input id="feelingCheckbox" type='checkbox'/>
        </div>
        <div class="circle4">
          <img class="circle4" src="../img/feeling4.png"> 
          <input id="feelingCheckbox" type='checkbox'/>
        </div>
        <div class="circle5">
          <img class="circle5" src="../img/feeling5.png"> 
          <input id="feelingCheckbox" type='checkbox'/>
        </div>

        </div>
     <nav>
      
      </nav>

        

      </div>
</template>

<script>
export default {

props:{
    exercises:[]
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
  background-color: rgb(248, 48, 75);
  border-radius: 50%;
}
.circle2 {
  height: 50px;
  width: 50px;
  background-color: rgb(255, 160, 71);
  border-radius: 50%;
}

.circle3 {
  height: 50px;
  width: 50px;
  background-color: rgb(223, 222, 222);
  border-radius: 50%;
}
.circle4 {
  height: 50px;
  width: 50px;
  background-color: rgb(253, 251, 108);
  border-radius: 50%;
}
.circle5 {
  height: 50px;
  width: 50px;
  background-color: rgb(140, 255, 73);
  border-radius: 50%;
}
</style>

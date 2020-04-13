<template>
    <div>
        <router-link to='/Dashboard' tag='button'>Punk Out?!</router-link><br>

        <h1> How do you feel pre-workout?</h1>
        <div class='howYouFeel'>
        <div class="circle1"></div> 
        <div class="circle2"></div>
        <div class="circle3"></div>
        <div class="circle4"></div>
        <div class="circle5"></div>

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
h1 {
    text-align: center;
}
.howYouFeel{
    display:flex;
    justify-content: space-around;
}
.circle1 {
  height: 50px;
  width: 50px;
  background-color: rgb(180, 0, 0);
  border-radius: 50%;
}
.circle2 {
  height: 50px;
  width: 50px;
  background-color: rgb(211, 122, 199);
  border-radius: 50%;
}

.circle3 {
  height: 50px;
  width: 50px;
  background-color: #555;
  border-radius: 50%;
}
.circle4 {
  height: 50px;
  width: 50px;
  background-color: rgb(194, 214, 122);
  border-radius: 50%;
}
.circle5 {
  height: 50px;
  width: 50px;
  background-color: rgb(18, 221, 69);
  border-radius: 50%;
}
</style>

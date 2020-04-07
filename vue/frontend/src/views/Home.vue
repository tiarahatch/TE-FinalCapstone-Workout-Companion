<template>
  <div class="home">
    <h1>Workout Companion</h1>
    <div>
      <!-- <img src ="../img/workout.jpeg"> -->
      <video autoplay muted loop id="myVideo">
        <source src="../img/clip.mp4" type="video/mp4">
      </video>
      
      </div>
    <router-link to='/premade-workouts' tag='button'>Premade-workouts</router-link>
     <router-link to='/schedule' tag='button'>Schedule</router-link>
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
h1 {
  color: blue;
}



</style>
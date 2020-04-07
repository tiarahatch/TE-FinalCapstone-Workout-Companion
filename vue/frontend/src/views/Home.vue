<template>
  <div class="home">
    <h1>Home</h1>
    <p>You must be authenticated to see this</p>
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

</style>
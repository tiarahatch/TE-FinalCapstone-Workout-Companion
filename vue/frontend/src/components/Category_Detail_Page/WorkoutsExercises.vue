<template>
  <div class="body">
    <div class="exerciseLists">
      <div v-for="item in exercises" v-bind:key="item.exerciseID" class="exercise">
        <h3>{{item.name}}</h3>
        <h4>Sets: {{item.sets}}</h4>
        <h4 v-if="item.reps <= 15">Reps: {{item.reps}}</h4>
        <h4 v-if="item.reps > 15">Reps: {{item.reps}} Seconds</h4>
      </div>
    </div>

    <router-link
      :to="{ name: 'startworkout', params: {exercises} }"
      tag="button"
      class="startButton"
    >Start Workout!</router-link>
  </div>
</template>

<script>
export default {
  props: {
    exercises: { type: Array }
  },
  name: "workout-exercises"
};
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Oswald&display=swap');

* { 
  font-family: 'Oswald', sans-serif;
}


.body {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-around;
}
.exerciseLists {
  width: 90%;
  height: 60%;
  display: flex;
  justify-content: space-around;
}

.exercise {
  text-align: center;
  font-size:150%;
  width: 29%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.75);
  color: white;
  /* color: #7ac1ff; */
  border-radius: 5px;
 box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);

  transition: 0.6s;
}
.exercise h3{
    text-decoration: underline white;
}

.exercise:hover {
  width: 30%;
  /* background-color: rgba(0, 0, 0, 0.9); */
  box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.4),
    0 17px 50px 0 rgba(0, 0, 0, 0.25);
}

.startButton {
  justify-content: center;
  display: flex;
  font-size: 200%;
  border: none;
  width: 50%;
  height: 25%;
  background-color: rgba(0, 0, 0, 0.5);
  color: white;
  cursor: pointer;
  border-radius: 8px;
  transition: 0.6s;
}

.startButton:hover {
  background-color: rgba(0, 0, 0, 0.75);
  box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);
}


</style>

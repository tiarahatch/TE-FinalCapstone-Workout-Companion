<template>
<div>
     <div class="meter">
  <span style="width: 100%"></span>
</div>

<div class='exercise-img-instructions'>

    <div class='exercise'>
    <h3 style='text-decoration: underline'> {{exercise.name}}</h3> 
    <ul>
    <li v-if='exercise.reps > 20'> Reps: {{exercise.reps}} Seconds </li>
    <li v-if='exercise.reps < 20'> Reps: {{exercise.reps}} </li>
    <li> Sets: {{exercise.sets}} </li>
    </ul>
    </div>

<div class='img-instructions'>
        <div class='img'>
        <p>image goes here</p>
         </div>

        <div class='instructions'>
         <h3 style='text-decoration: underline'>Instructions</h3>
        <p>exercise instructions</p>
        </div>
</div>
   
</div>

    
         <div class='notes'>
    <h4 style='text-align: left'>Notes: </h4>
    <p style='text-align: right'>notes here</p>
    </div>    

    </div>
</template>


<script>
export default {
  name: "exercise-in-workout",
  data() {
    return {};
  },
  props: {
    exercise: Object
  }
};
</script>

<style scoped>
.meter {
  height: 20px; /* Can be anything */
  position: relative;
  background: #555;
  -moz-border-radius: 25px;
  -webkit-border-radius: 25px;
  border-radius: 25px;
  padding: 10px;
  box-shadow: inset 0 -1px 1px rgba(255, 255, 255, 0.3);
}
.meter > span {
  display: flex;
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
li {
  list-style-type: none;
  text-align: left;
}
.exercise {
  background-color: red;
  display: flex;
  flex-direction: column;
  width: 50%;
}
.img {
  background-color: blue;
  width: 100%;
  height: 50%;
}
.notes {
  background-color: green;
  display: flex;
  margin-top: 8%;
  width: 18%;
}
.instructions {
  background-color: cyan;
  width: 100%;
  text-align: center;
  height: 50%;
}
.exercise-img-instructions {
  display: flex;
  /* justify-content: space-between;
  margin-top: 4%;
  margin-left: auto;
  margin-right: auto; */
  margin: auto;
  width: 90%;
  height: 600px;
  background-color: yellow;
}
.img-instructions {
  display: flex;
  flex-direction: column;
  width: 50%;
}
</style>
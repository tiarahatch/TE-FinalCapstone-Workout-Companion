<template>
    <div>
     <div class="meter">
  <span style="width: 100%"></span>
</div>
<div class='exercise' style='border: 1px solid black'>
    {{exercise.name}}
  <ul>
      <li>
         Reps: {{exercise.reps}}
      </li>
      <li>
          Sets: {{exercise.sets}}
      </li>
      </ul>
</div>
<div>
      <p>image goes here</p>
      </div>

    <div>
      <h3>{{exercise.name}}</h3>
      <p>exercise instructions</p>
    </div>

    <div>
    <h4>Notes: </h4>
    <p>notes here</p>
    </div>


    </div>
</template>


<script>
export default {
    name: 'exercise-in-workout',
    data(){
        return{
     
        }
    },
    props:{
        exercise: [],
    }
}
</script>

<style scoped>
.meter { 
	height: 20px;  /* Can be anything */
	position: relative;
	background: #555;
	-moz-border-radius: 25px;
	-webkit-border-radius: 25px;
	border-radius: 25px;
	padding: 10px;
	box-shadow: inset 0 -1px 1px rgba(255,255,255,0.3);
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
    rgb(43,194,83) 37%,
    rgb(84,240,84) 69%
  );
  box-shadow: 
    inset 0 2px 9px  rgba(255,255,255,0.3),
    inset 0 -2px 6px rgba(0,0,0,0.4);
  position: relative;
  overflow: hidden;
}
.exercise {
    display: flex;
}
li {
    list-style-type: none;
    margin-left: -195%;
}
</style>
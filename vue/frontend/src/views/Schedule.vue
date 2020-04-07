<template>
  <div>
    <h1>Upcoming Events</h1>
   <!-- <p>You must be authenticated to see this</p> -->
    <div id = 'dailyView' class = 'show'>
      <!-- <button @click = 'created'/> -->
      <ul>
        <li v-for= 'item in schedule' v-bind:key= 'item.classID'>
           <p> {{item.className}} </p>
           <p> {{dayOfWeek(item.dayOfTheWeek)}}
            {{timeSlotFormat(item.timeSlot)}} </p>
           <p>Signed Up: {{item.reservedSpaces}}/{{item.maxOccupancy}}</p>
        </li>
      </ul>
    </div>
    <div>
      <button @click = 'weekView'> Week View </button>
    </div>
    <div>
      <button @click = 'monthView'> Month View </button>
    </div>

  </div>
</template>



<script>
export default {
  name: 'schedule',


 data(){
  return{
    schedule: [],

  };
},
computed:{

},
methods:{
  weekView(){
    let dailyView = document.getElementById('dailyView');
    dailyView.className= 'hidden';
    let monthView = document.getElementById('monthView');
    monthView.className= 'hidden';


  },
  monthView(){
    let dailyView = document.getElementById('dailyView');
    dailyView.className= 'hidden';
    let weekView = document.getElementById('weekView');
    weekView.className= 'hidden';
    

  },
  dayOfWeek(dayInt){
    if(dayInt === 1){
      return "Monday"
    }else if(dayInt === 2){
      return "Tuesday"
    }else if(dayInt === 3){
      return "Wednesday"
    }else if(dayInt === 4){
      return "Thursday"
    }else if(dayInt === 5){
      return "Friday"
    }else if(dayInt === 6){
      return "Saturday"
    }else if(dayInt === 7){
      return "Sunday"
    }
  },

  timeSlotFormat(timeSlot){
    if(timeSlot<12){
      return (timeSlot + ' AM')
    }else{
      return (timeSlot + ' PM')
    }
  }

},
  beforeCreate() {
    fetch(`${process.env.VUE_APP_REMOTE_API}/api/schedule`)
      .then((response)=>{
        return response.json();
      })
      .then((json)=>{
       this.schedule = json;
       console.log(json);
      })
  }
};
// }



</script>

<style scoped>
.show{
  display:block;
}
.hidden{
  display:none;
}


</style>
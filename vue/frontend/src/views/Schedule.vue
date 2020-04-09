<template>
  <div>
     <nav>
      <router-link to='/' tag='button'>Home</router-link>
      </nav>
    <h1>Upcoming Events</h1>
   <!-- <p>You must be authenticated to see this</p> -->
  <div>
   <button @click = 'dayView()' class='button-margin'> Day View </button>
    <div id = 'dayList' class = 'show'>
      <ul>
        <li v-for= 'item in daySchedule' v-bind:key= 'item.classID' class='border'>
           <p> {{item.className}} </p>
           <p> {{item.date}}
            {{timeSlotFormat(item.timeSlot)}} </p>
           <p>Signed Up: {{item.reservedSpaces}}/{{item.maxOccupancy}}</p>
        </li>
      </ul>
    </div>
    </div>
    <div>
      <button @click = 'weekView()' class='button-margin'> Week View </button>
      <div class='hidden' id='weekList'>
      <ul>
        
        <li v-for= 'item in weekSchedule' v-bind:key= 'item.classID' class='border'>
          <div>
           <p> {{item.className}} </p>
           <p> {{item.date}}
            {{timeSlotFormat(item.timeSlot)}} </p>
           <p>Signed Up: {{item.reservedSpaces}}/{{item.maxOccupancy}}</p>
           </div>
        </li>
        
      </ul>
      </div>
    </div>
    <div>
      <button @click = 'monthView()' class='button-margin'> Month View </button>
      <div class='hidden' id='monthList'>
      <ul>
        <li v-for= 'item in monthSchedule' v-bind:key= 'item.classID' class='border'>
          <div>
           <p> {{item.className}} </p>
           <p> {{item.date}}
            {{timeSlotFormat(item.timeSlot)}} </p>
           <p>Signed Up: {{item.reservedSpaces}}/{{item.maxOccupancy}}</p>
           </div>
        </li>
      </ul>
      </div>
    </div>

  </div>
</template>



<script>
export default {
  name: 'schedule',


 data(){
  return{
    daySchedule: [],
    weekSchedule: [],
    monthSchedule: [],

  };
},
computed:{

},
methods:{
 dayView(){
    let dailyView = document.getElementById('dayList');
    dailyView.className= 'show';
    let monthView = document.getElementById('monthList');
    monthView.className= 'hidden';
    let weekView = document.getElementById('weekList');
    weekView.className = 'hidden';
   


  },



  weekView(){
    let dailyView = document.getElementById('dayList');
    dailyView.className= 'hidden';
    let monthView = document.getElementById('monthList');
    monthView.className= 'hidden';
    let weekView = document.getElementById('weekList');
    weekView.className = 'show';
   


  },
  monthView(){
    let dailyView = document.getElementById('dayList');
    dailyView.className= 'hidden';
    let weekView = document.getElementById('weekList');
    weekView.className= 'hidden';
    let monthList = document.getElementById('monthList')
    monthList.className = 'show';
    

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
    fetch(`${process.env.VUE_APP_REMOTE_API}/api/dailyschedule`)
      .then((response)=>{
        return response.json();
      })
      .then((json)=>{
       this.daySchedule = json;
       console.log(this.dailySchedule)
      })

      fetch(`${process.env.VUE_APP_REMOTE_API}/api/weeklyschedule`)
      .then((response)=>{
        return response.json();
      })
      .then((json)=>{
       this.weekSchedule = json;
       console.log(this.weekSchedule)
      })

          fetch(`${process.env.VUE_APP_REMOTE_API}/api/monthlyschedule`)
      .then((response)=>{
        return response.json();
      })
      .then((json)=>{
       this.monthSchedule = json;
       console.log(this.monthSchedule)
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
.border {
  border: 1px solid black;
  margin-top: 2px;
  padding-left: 5px;
}
li {
  list-style: none;
}

.button-margin {
  margin-bottom: 20px;
}


</style>
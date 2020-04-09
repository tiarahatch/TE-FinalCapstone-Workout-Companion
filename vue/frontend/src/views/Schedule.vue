<template>
  <div>
     <nav>
      <router-link to='/' tag='button'>Home</router-link>
      </nav>
    <h1>Upcoming Events</h1>
   
   
    

   <!-- <p>You must be authenticated to see this</p> -->
    <div id='scheduleHeading'>
    <h2> This Week's Schedule</h2> 
    <h3>{{getHeaderDates()[0]}} - {{getHeaderDates()[1]}} </h3>
    </div>
    <div>
     <!-- <button @click = 'weekView()' class='button-margin'> Week View </button> -->
      <div class='show' id='weekList'>
      <ul>
        
        <li v-for= 'day in weekSchedule' :key = 'day.classID' class='border'>
          
          <schedule-day v-bind:daySchedule='day' ></schedule-day>
         
        </li>
        
      </ul>
      </div>
    </div>
    
  </div>
</template>



<script>

import ScheduleDay from  '@/components/ScheduleDay.vue'

export default {
  name: 'schedule',
  components:{
      ScheduleDay
    },

 data(){
  return{
    weekSchedule: [],
      
  };
},
computed:{

},
methods:{

getHeaderDates(){
  let todayArray = this.weekSchedule[0];
  let today = todayArray[0].date;
  let weekArray = this.weekSchedule[this.weekSchedule.length-1];
  let week = weekArray[0].date;
  let headerDates = [today, week];

  return headerDates;
},

  getDate(){
   let todaysDate = new Date();
    let currentMonth = todaysDate.getMonth();
    let currentDay = todaysDate.getDate();
    let currentDate = currentMonth+1 + " - " + currentDay;
return currentDate;

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
  created() {

      fetch(`${process.env.VUE_APP_REMOTE_API}/api/weeklyschedule`)
      .then((response)=>{
        return response.json();
      })
      .then((json)=>{
       this.weekSchedule = json;
       console.log(this.weekSchedule)
      })


  }
};
// }



</script>

<style scoped>
#scheduleHeading{
  text-align: center;
  background-color: grey;
}
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
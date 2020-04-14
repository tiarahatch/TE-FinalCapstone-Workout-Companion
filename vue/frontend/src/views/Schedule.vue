<template>
  
  
  <div>
    
    <simple-modal v-model="isShow" title="Class Description">
      <template slot="body">
        <h2>Class: {{classToShowDetails.className}}</h2>
        <h3>Time: {{timeSlotFormat(classToShowDetails.timeSlot)}} </h3>
        <h4>Availability: {{classToShowDetails.reservedSpaces}}/{{classToShowDetails.maxOccupancy}}</h4>
        <p>{{classToShowDetails.classDescription}}</p>
         
         <button> Sign Up </button>
      </template>
      <!-- <template slot="footer">
        <button>OK</button>
      </template> -->
    </simple-modal>
    <!-- <button @click="isShow = !isShow">on off button</button> -->


    <nav>
      <router-link to="/" tag="button">Home</router-link>
    </nav>
    <!-- <h1>Upcoming Events</h1> -->

    <!-- <p>You must be authenticated to see this</p> -->
    <div id="scheduleHeading">
      <h2>This Week's Schedule</h2>
      <h3>{{getHeaderDates()[0]}} - {{getHeaderDates()[1]}}</h3>
    </div>
    <div>

      <div class="show" id="weekList">
        <div>
          <div v-for="day in weekSchedule" :key="day.classID" class="border">
           
            <schedule-day v-bind:daySchedule="day" v-bind:isShow="isShow" v-on:updateIsShow="switchIsShow($event[0]), classToShowDetails = $event[1]"></schedule-day>
           
            <!-- <schedule-class-details v-if="showDetails" /> -->
           
          </div>
        </div>
      </div>
    </div>
    <div class='background-img'>
      <span></span>
    </div>
  </div>
</template>



<script>
// import auth from '@/auth'
import SimpleModal from 'simple-modal-vue'
import ScheduleDay from "../components/ScheduleDay.vue";


export default {
  name: "schedule",
  components: {
    ScheduleDay,
    
    SimpleModal
  },

  data() {
    return {
      weekSchedule: [],
      showDetails: false,
      isShow: false,
      classToShowDetails: ''
    };
  },
  computed: {},
  methods: {
   
   switchIsShow: function(updatedIsShow){
      this.isShow = updatedIsShow;
    },

    showToTrue(){
      this.show = true;
    },
    getHeaderDates() {
      let todayArray = this.weekSchedule[0];
      let today = todayArray[0].date;
      let weekArray = this.weekSchedule[this.weekSchedule.length - 1];
      let week = weekArray[0].date;
      let headerDates = [today, week];

      return headerDates;
    },

    getDate() {
      let todaysDate = new Date();
      let currentMonth = todaysDate.getMonth();
      let currentDay = todaysDate.getDate();
      let currentDate = currentMonth + 1 + " - " + currentDay;
      return currentDate;
    },

    dayOfWeek(dayInt) {
      if (dayInt === 1) {
        return "Monday";
      } else if (dayInt === 2) {
        return "Tuesday";
      } else if (dayInt === 3) {
        return "Wednesday";
      } else if (dayInt === 4) {
        return "Thursday";
      } else if (dayInt === 5) {
        return "Friday";
      } else if (dayInt === 6) {
        return "Saturday";
      } else if (dayInt === 7) {
        return "Sunday";
      }
    },

    timeSlotFormat(timeSlot) {
      if (timeSlot < 12) {
        return timeSlot + " AM";
      } else {
        return timeSlot + " PM";
      }
    }
  },
  created() {
    fetch(`${process.env.VUE_APP_REMOTE_API}/api/weeklyschedule`)
      .then(response => {
        return response.json();
      })
      .then(json => {
        this.weekSchedule = json;
        console.log(this.weekSchedule);
      });
  }
};
// }
</script>

<style scoped>

.background-img { 
    background-image: url(../img/BackgroundImages/signuppage2.jpg); 
    width: 100%;
    height: 100%; 
    position: fixed;
    color: transparent;
    background-size: cover;
    background-repeat: none;
    opacity: 0.4;
    z-index: -10;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

#scheduleHeading {
  text-align: center;
  background-color: grey;
}
.show {
  display: block;
}
.hidden {
  display: none;
}
.border {
  border: 1px solid black;
  margin-top: 2px;

  background-color: rgba(37, 37, 37, 0.2);
  margin-bottom: 2%;
  transition-duration: .75s;
}

.border:hover{
  background-color: rgba(37, 37, 37, 0.35);
}
li {
  list-style: none;
}


</style>
<template>
  
  
  <div>
    
    <simple-modal id='modal' v-model="isShow" :title="classTitle">
      <template slot="body">
       <div id='modalBody'>
        <h3>Time: {{timeSlotFormat(classToShowDetails.timeSlot)}} </h3>
        <h4>Availability: {{classToShowDetails.reservedSpaces}}/{{classToShowDetails.maxOccupancy}}</h4>
        <p>Class Description: <br/>
          {{classToShowDetails.classDescription}}</p>
         
         <button class="signUpButton"> Sign Up </button>
         </div>
      </template>
    </simple-modal>



   
   

    <!-- <p>You must be authenticated to see this</p> -->

    <div class='navButtons'>
      
      <router-link v-if="loggedIn" to="/dashboard" tag="button">My Dashboard</router-link>
      <button v-if="loggedIn" v-on:click='logout'> LogOut</button>
      <router-link v-if="!loggedIn" to="/login" tag="button">Login</router-link>
      

      </div>
    


    <div id="scheduleHeading">
      <h2>This Week's Schedule</h2>
      <h2> ({{getHeaderDates()[0]}}) - {{getHeaderDates()[1]}}</h2>
    </div>
    <div>

      <div class="show" id="weekList">
        <div>
          <div v-for="day in weekSchedule" :key="day.classID" class="border">
           
            <schedule-day v-bind:daySchedule="day" v-bind:isShow="isShow" v-on:updateIsShow="switchIsShow($event[0]), classToShowDetails = $event[1]"></schedule-day>
           
           
          </div>
        </div>
      </div>
    </div>``
    <div class='background-img'>
      <span></span>
    </div>
    
  </div>
</template>



<script>
import auth from '@/auth'
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
      isShow: false,
      classToShowDetails: ''

    };
  },
  computed: {
    dayInt(){
      let d = new Date();
      return d.getDay();
    },
    classTitle(){
      let title = "Class: "+ this.classToShowDetails.className;
      return title
    },
    loggedIn(){
    return auth.loggedIn();

    }

  },
  methods: {
   logout() {
        auth.logout();
        localStorage.removeItem('Authorization');
        this.$router.go('/')
  },
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
      } else if (dayInt === 0) {
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
@import url("https://fonts.googleapis.com/css2?family=Oswald&display=swap");

*{
  font-family: 'Oswald', sans-serif;
}

#modalBody{
  /* background-color:rgb(211, 211, 211); */
  padding:2%;
  padding-top: 0;

}
#modalBody h3{
  margin-top:0;
}

.signUpButton {
  display: block;
  text-align: center;
  font-size: 100%;
  border: none;
  height: 50%;
  width: 65%;
  margin:auto;

  background-color: rgba(0, 0, 0, 0.5);
  color: white;
  border-radius: 3px;

  

  transition: 0.6s;
}

.signUpButton:hover {
  height: 51%;
  width: 66%;
  cursor: pointer;
  background-color: rgba(0, 0, 0, 0.75);
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}



.navButtons{
    display:flex;
    justify-content: flex-end;
    margin-bottom:1%;
    
}
.navButtons button{
    width: 10%;
    height: 30px; 
    background-color: rgba(0, 0, 0, 0.5);
    color:white;
    font-family: 'Oswald', sans-serif;
    border: none;
    transition: .6s;
}

.navButtons button:hover {
  width: 12%;
  height: 30px;
  cursor: pointer;
  background-color: rgba(0, 0, 0, 0.75);
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}


.background-img { 
    background-image: url(../img/BackgroundImages/signuppage2.jpg); 
    background-blend-mode: screen;
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
  font-family: 'Oswald', sans-serif;
  border: 1px solid black;
  width: 30%;
  background-image:linear-gradient(rgba(219, 219, 219, 0.5),rgba(117, 117, 117, 0.8));
  display:flex;
  flex-direction: column;
  margin:auto;
  margin-bottom: 2%;
  
}
#scheduleHeading h2{
  text-align: center;

  /* margin:auto; */
}

.border {
  border: 1px solid black;
  margin-top: 2px;
  height:auto;
   background-image:linear-gradient(rgba(219, 219, 219, 0.4),rgba(117, 117, 117, 0.5));
  /* background-color: rgba(37, 37, 37, 0.2); */
  margin-bottom: 2%;
  transition-duration: .75s;
}

.border:hover{
  background-color: rgba(37, 37, 37, 0.4);
}


</style>
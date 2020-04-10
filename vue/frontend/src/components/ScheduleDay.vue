<template>
  <div>
   <!-- <h4 v-on:click="changeIsShow"> click for details </h4>  -->
    <h3>{{daySchedule[0].date}}</h3>
    <br />
    <div class="daySchedule">
      
      <li v-for="item in daySchedule" v-bind:key="item.classID" >
       <button  v-on:click="changeIsShow">
        <p>{{item.className}}</p>
        <p>{{timeSlotFormat(item.timeSlot)}}</p>
        <p>Signed Up: {{item.reservedSpaces}}/{{item.maxOccupancy}}</p>
        <!-- <h4 v-on:click= 'changeIsShow'> click for details </h4> -->
        </button>
      </li>

     
    </div>
  </div>
</template>

<script>

export default {
  
  name: "schedule-day",
  event: 'change',
//   prop: 'isShow',

  props: {
    daySchedule: {
      type: Array,
      required: false
    },

   isShow: {
       type: Boolean, 
       
   }
  },
  data(){
      return{
          
      };
  },

  methods: {
    timeSlotFormat(timeSlot) {
      if (timeSlot < 12) {
        return timeSlot + " AM";
      } else {
        return timeSlot + " PM";
      }
    },

    changeIsShow: function(){
        if(this.isShow === false){
             this.isShow === true;
        }else{
             this.isShow === false;
        }
        this.$emit('updateIsShow',true)
    },

  }
};
</script>


<style scoped>
h3{
    text-align: center;
    background-color: lightgrey;
}
.class {
    /* width: 10%; */
  border: 1px solid black;
}
.daySchedule {
    padding-left: none;
    list-style-type: none;
  display: flex;
  justify-content: space-around;
  padding-bottom: 2%;
}
</style>
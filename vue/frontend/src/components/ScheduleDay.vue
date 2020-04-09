<template>
   <div>
      <h3> {{daySchedule[0].date}}</h3> <br/>
       <ul class='daySchedule'>
           
           <li v-for='item in daySchedule' v-bind:key='item.classID' class='class'>
               <p> {{item.className}}</p>
               <p> {{timeSlotFormat(item.timeSlot)}}</p>
               <p> Signed Up: {{item.reservedSpaces}}/{{item.maxOccupancy}}</p>
           </li>
       </ul>


   </div>
   
    
</template>

<script>
export default {
    name:'schedule-day',
    props:{
        daySchedule:{
            type: Array,
            required:false
        }
    },

methods:{
    timeSlotFormat(timeSlot){
    if(timeSlot<12){
      return (timeSlot + ' AM')
    }else{
      return (timeSlot + ' PM')
    }
  }
}


}


</script>


<style scoped>
.class{
    border: 1px solid black;

}
.daySchedule{
    display:flex;
}
</style>
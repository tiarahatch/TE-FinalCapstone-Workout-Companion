<template>
  <div>
   <!-- <h4 v-on:click="changeIsShow"> click for details </h4>  -->
    <h3>{{daySchedule[0].date}}</h3>
    <br />
    <div class="daySchedule">
      
      <li v-for="item in daySchedule" v-bind:key="item.classID" >
      
       <!-- <button  v-on:click="changeIsShow"> -->

        <button v-on:click="emit_event(item)" v-bind:style= '{ backgroundImage: `url( ${ "../img/" + item.className + ".png" } )` }' class ='classButton'>
        <!-- <button v-on:click="emit_event(item)" class ='classButton'> -->
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
         
         imageName: ''

      };
  },

  methods: {
   classURL(){
     
     return '../img/' + this.imageName + '.png';
   },
   
   timeSlotFormat(timeSlot) {
      if (timeSlot < 12) {
        return timeSlot + " AM";
      } else {
        return timeSlot + " PM";
      }
    },

    emit_event: function (item){
     
        
        this.$emit('updateIsShow', [true, item])
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
.classButton{
  /* background-image: url("../img/Kick Boxing.png" ); */
  
  background-repeat: no-repeat;
  background-size: contain;
  background-color: transparent;
  
}
</style>
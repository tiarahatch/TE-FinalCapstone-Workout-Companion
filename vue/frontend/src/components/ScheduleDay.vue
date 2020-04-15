<template>
  <div>
  <div id='dayHeading'>
    <p> {{daySchedule[0].date}} </p>
  </div>
    <div class="daySchedule">
      
      <div v-for="item in daySchedule" v-bind:key="item.classID" >
      
       

        <!-- <button v-on:click="emit_event(item)" v-bind:style= '{ backgroundImage: `url( ${ "../img/" + item.className + ".png" } )`, backgroundSize: "contain", backgroudRepeat: "no-repeat" }' class ='classButton'> -->
        <button v-on:click="emit_event(item)" class ='classButton' :id="item.className.split(' ').join('')">
        <p>{{item.className}}</p>
        <p>{{timeSlotFormat(item.timeSlot)}}</p>
        <p>Signed Up: {{item.reservedSpaces}}/{{item.maxOccupancy}}</p>
        
        <!-- <h4 v-on:click= 'changeIsShow'> click for details </h4> -->
        </button>
      </div>

     
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

#dayHeading{
    margin-top: 0;
    margin-bottom: 0;
    
    text-align: center;
    background-image:linear-gradient(rgba(219, 219, 219, 0.5),rgba(117, 117, 117, 0.8));
    
}

#dayHeading p{
    
    font-size: 150%;
    margin-top: 0;
    margin-bottom: 0;
}
.class {
    /* width: 10%; */
  border: 1px solid black;
  
}
.daySchedule {
  height:auto;
  padding-left: none;
  list-style-type: none;
  display: flex;
  justify-content: space-around;
  margin-bottom: 2%;
  margin-top: 2%;
}
.classButton{

  width: 100%;
  background-repeat: no-repeat;
  background-size: contain;

  background-position: center;
  opacity: .5;
  border-radius: 10px;

  transition-duration: 0.6s;
}

.classButton:hover{
  
  opacity: .8;
  height:115%;
  width: 115%;
  box-shadow:
       3px 3px 0  rgb(209, 209, 209),
     -1px -1px 0  rgb(209, 209, 209),  
      1px -1px 0  rgb(209, 209, 209),
      -1px 1px 0  rgb(209, 209, 209),
       1px 1px 0  rgb(209, 209, 209);

}
.classButton:active{
  opacity: .35;
}

/* #WaterAerobics{
background-image: url("../img/Water Aerobics.png" );
}
#Yoga{
background-image: url("../img/Yoga.png" );
}
#KickBoxing{
background-image: url("../img/Kick Boxing.png" );
}
#Spinning{
background-image: url("../img/Spinning.png" );
}
#Pilates{
background-image: url("../img/Pilates.png" );
} */

</style>
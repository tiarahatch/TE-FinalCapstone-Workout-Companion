<template>
  <div>
    <h3>{{daySchedule[0].date}}</h3>
    <br />
    <ul class="daySchedule">
      <li v-for="item in daySchedule" v-bind:key="item.classID" class="class">
        <p>{{item.className}}</p>
        <p>{{timeSlotFormat(item.timeSlot)}}</p>
        <p>Signed Up: {{item.reservedSpaces}}/{{item.maxOccupancy}}</p>
      </li>

      <simple-modal v-model="isShow" title="Modal Header">
        <template slot="body">
          <h2>My modal</h2>
          <input />
          <p>Hello you</p>
        </template>
        <template slot="footer">
          <button>OK</button>
        </template>
      </simple-modal>
      <button @click="isShow = !isShow">on off button</button>
    </ul>
  </div>
</template>

<script>
import SimpleModal from 'simple-modal-vue'
export default {
  name: "schedule-day",
  props: {
    daySchedule: {
      type: Array,
      required: false
    },
    components: {
        SimpleModal
    }
  },
  data(){
      return{
          isShow:false
      };
  },

  methods: {
    timeSlotFormat(timeSlot) {
      if (timeSlot < 12) {
        return timeSlot + " AM";
      } else {
        return timeSlot + " PM";
      }
    }
  }
};
</script>


<style scoped>
.class {
  border: 1px solid black;
}
.daySchedule {
  display: flex;
}
</style>
<template>
  <div>
    <h1>Upcoming Events</h1>
   <!-- <p>You must be authenticated to see this</p> -->
    <div>
      <button @click = 'created'/>
      <ul>
        <li v-for='item in schedule' v-bind:key='item'>
            {{item.className}}
        </li>
      </ul>
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
methods:{
  created() {
    fetch(`${process.env.VUE_APP_REMOTE_API}/api/schedule`)
      .then((response)=>{
        return response.json();
      })
      .then((json)=>{
       this.schedule = json;
       console.log(json);
      })
  }
}

}


</script>
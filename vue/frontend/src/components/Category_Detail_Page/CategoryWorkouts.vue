<template>
    <div>
    <div>
        <div class='border'>
        <ul>
            <li>
                {{categories[id - 1].name}}
              <ul>
            <!-- <li v-for='workout in workouts' v-bind:key='workout.workoutID'>
                {{workout.name}}
                </li> -->
                {{workouts}}
            </ul>
            </li>
        </ul>
        </div> 
    </div>
    </div>
</template>

<script>
export default {
    name: 'category-workouts',
    
    data() {
       return {
        categories: [],
        category: '',
        displayName: '',
    }
},
props: {
    id: String,
// id: {
//     type: Number,
//     required: false,
// },
    workouts: Array,
},

methods: {
},
computed: {
    displayCategory(id) {
        return this.categories[id - 1].name;
    }
},
 created() {
      fetch(`${process.env.VUE_APP_REMOTE_API}/api/categories`)
      .then((response)=>{
        return response.json();
      })
      .then((json)=>{
       this.categories = json;
      })
      
     
       
  }
   
}

</script>


<style>
.border {
    border: 1px solid black;
}
</style>

<template>
    <div>
    <div>
        <div class='border'>
        <ul>
            <li>
                {{categories[id - 1].name}}
                </li>
        <ul>
            <li v-for='workout in workouts' v-bind:key='workout.workoutID'>
                {{workout.name}}
                </li>
            </ul>
            <!-- <li v-for='category in categories' v-bind:key='category.categoryID' class='box'>
        
            {{category.name}} 
             </li> -->
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
        workouts: [],
        categories: [],
        category: '',
    }
},
props: {
id: {
    type: String,
    required: false,
}
},

methods: {
displayWorkouts(id) {
 fetch(`${process.env.VUE_APP_REMOTE_API}/api/workouts/${id}`,{
     method: 'GET',
     headers: {
       "Content-Type": "application/json"
     },
   
     
   })
   
    .then((response)=> {
      if(response.ok) {
        return response.json();
        
        
      } 

    }) 
    .then((json) => {
      this.workouts = json;
      console.log(this.workouts)
    }) 
},

},
 created() {
      fetch(`${process.env.VUE_APP_REMOTE_API}/api/categories`)
      .then((response)=>{
        return response.json();
      })
      .then((json)=>{
       this.categories = json;
       console.log(json);
      })
     
       for(let i = 0; i < this.categories.length; i++) {
           if (this.categories[i].categoryID == this.id) {
               this.category = this.categories[i].name;
           }
       }
   
  }
}

</script>


<style>
.border {
    border: 1px solid black;
}
</style>

<template>
    <div>
    <div>
        <div class='border'>
             
        <ul>

            <li>
               
                {{categories[id - 1].name}}
                 </li>
        </ul>
        

        <li v-for="item in workouts" v-bind:key="item.workoutID" >
    
        <button v-on:click='fetchExercises(item.workoutID)'>{{item.name}}</button>
       
        
      </li>
     
        </div> 
    </div>
    </div>
</template>

<script>
import auth from '@/auth'
export default {
    name: 'category-workouts',
    components: {
        
    },
    
    data() {
       return {
        categories: [],
        workouts: [],
      
        
    }
},
props: {
    id:  {type: String},
    workoutLists: {type: Array}
},

methods: {
   
   fetchExercises(id) {
       
           
        fetch(`${process.env.VUE_APP_REMOTE_API}/api/exercise/${id}`,{
     method: 'GET',
     headers: {
       'Authorization' : 'Bearer ' + auth.getToken(),
       "Content-Type": "application/json"
     },
   })
    .then((response)=> {
     
        return response.json();
    }) 
    .then((json) => {
      this.$emit('exerciseEmit', json)
      //this.exercises = json;
      //console.log(this.exercises)
     // this.$emit('exerciseEmit', this.exercises)

    }) 
       
   },
      
},
computed: {
    
},
 created() {
      fetch(`${process.env.VUE_APP_REMOTE_API}/api/categories`,{
        headers:{
          'Authorization' : 'Bearer ' + auth.getToken(),
        }
      })
      .then((response)=>{
        return response.json();
      })
      .then((json)=>{
       this.categories = json;
      })

        fetch(`${process.env.VUE_APP_REMOTE_API}/api/workouts/${this.id}`,{
     method: 'GET',
     headers: {
       'Authorization' : 'Bearer ' + auth.getToken(),
       "Content-Type": "application/json"
     },
   })
    .then((response)=> {
     
        return response.json();
    }) 
    .then((json) => {
      this.workouts = json;
      console.log(this.workouts)
    }) 
  },
  
  
}

</script>


<style>
.border {
    border: 1px solid black;
}
.hidden {
  display: none;
}
</style>

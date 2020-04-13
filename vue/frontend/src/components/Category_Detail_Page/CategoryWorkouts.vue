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

export default {
    name: 'category-workouts',
    components: {
        
    },
    
    data() {
       return {
        categories: [],
        workouts: [],
       exercises: [], 
        
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
   
   
   
   fetchExercises1(id) {
       
           
        fetch(`${process.env.VUE_APP_REMOTE_API}/api/exercise/${id}`,{
     method: 'GET',
     headers: {
       "Content-Type": "application/json"
     },
   })
    .then((response)=> {
     
        return response.json();
    }) 
    .then((json) => {
      this.exercises1 = json;
      console.log(this.exercises1)
      
    }) 
       
       
   },
   fetchExercises2(id) {
       
           
        fetch(`${process.env.VUE_APP_REMOTE_API}/api/exercise/${id}`,{
     method: 'GET',
     headers: {
       "Content-Type": "application/json"
     },
   })
    .then((response)=> {
     
        return response.json();
    }) 
    .then((json) => {
      this.exercises2 = json;
      console.log(this.exercises2)
      
    }) 
       
       
   },
   fetchExercises3(id) {
       
           
        fetch(`${process.env.VUE_APP_REMOTE_API}/api/exercise/${id}`,{
     method: 'GET',
     headers: {
       "Content-Type": "application/json"
     },
   })
    .then((response)=> {
     
        return response.json();
    }) 
    .then((json) => {
      this.exercises3 = json;
      console.log(this.exercises3)
      
    }) 
       
       
   },
},
computed: {
    
},
 created() {
      fetch(`${process.env.VUE_APP_REMOTE_API}/api/categories`)
      .then((response)=>{
        return response.json();
      })
      .then((json)=>{
       this.categories = json;
      })

        fetch(`${process.env.VUE_APP_REMOTE_API}/api/workouts/${this.id}`,{
     method: 'GET',
     headers: {
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


<style scoped>
/* .border {
    border: 1px solid black;
} */
.hidden {
  display: none;
}
button {
  text-align: center;
  font-size: 14px;
  margin:25px;
  border: none;
  width: 200px;
  background-color: black;
  color: #7ac1ff;
  border-radius: 15px;
  cursor: pointer;
  
}
</style>

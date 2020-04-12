<template>
    <div>
    <div>
        <div class='border'>
             
        <ul>

            <li>
               
                {{categories[id - 1].name}}
                 </li>
        </ul>
             <ul>
                 <li>
                     
                    <button v-on:click='fetchExercises1(workouts[0].workoutID)'>{{workouts[0].name}}</button>
                    <ul>
                        
                        <li v-for='exercise1 in exercises1' v-bind:key='exercise1.exerciseID'>
                            {{exercise1.name}}
                        </li>
                        </ul>
                 </li>
                  <li>
                     
                    <button v-on:click='fetchExercises2(workouts[1].workoutID)'>{{workouts[1].name}}</button>
                    <ul>
                        
                        <li v-for='exercise2 in exercises2' v-bind:key='exercise2.exerciseID'>
                            {{exercise2.name}}
                        </li>
                        </ul>
                 </li>
                 
                 <li>
                     
                    <button v-on:click='fetchExercises3(workouts[2].workoutID)'>{{workouts[2].name}}</button>
                    <ul>
                        
                        <li v-for='exercise3 in exercises3' v-bind:key='exercise3.exerciseID'>
                            {{exercise3.name}}
                        </li>
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
    components: {
        
    },
    
    data() {
       return {
        categories: [],
        workouts: [],
        exercises1: [],
        exercises2: [],
        exercises3: [],
       
       
        
    }
},
props: {
    id:  {type: String},
    workoutLists: {type: Array}
},

methods: {
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


<style>
.border {
    border: 1px solid black;
}
.hidden {
  display: none;
}
</style>

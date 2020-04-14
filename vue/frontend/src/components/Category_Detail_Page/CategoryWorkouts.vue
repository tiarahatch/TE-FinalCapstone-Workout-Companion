<template>
    <div>
    <div>
        <div class='border'>
        <div id='categoryName'>
            <h2>
                {{categories[id - 1].name}}
                
            </h2>
        </div>
        <div id='workoutList'>
        <li v-for="item in workoutLists" v-bind:key="item.workoutID">
    
        <button v-on:click='fetchExercises(item.workoutID)'>{{item.name}}</button>

        </li>
        </div>
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
computed:{
      categoryName:function(){
       return this.categories[this.id - 1].name
      },



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

    }) 
       
   },
      
},

beforeUpdate(){
  this.fetchExercises(this.workoutLists[0].workoutID);
},

//get names of workout in category and list of categories to print name from.
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
  },
  
  // beforeMount() {
  //       fetch(`${process.env.VUE_APP_REMOTE_API}/api/workouts/${this.id}`,{
  //    method: 'GET',
  //    headers: {
  //      'Authorization' : 'Bearer ' + auth.getToken(),
  //      "Content-Type": "application/json"
  //    },
  //  })
  //   .then((response)=> {
  //       return response.json();
  //   }) 
  //   .then((json) => {
  //     this.workouts = json;
  //     console.log(this.workouts)
  //     console.log('pppoooooppppp')
  //   }) 
  // },
  
}

</script>


<style scoped>

#workoutList{
  list-style: none;
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

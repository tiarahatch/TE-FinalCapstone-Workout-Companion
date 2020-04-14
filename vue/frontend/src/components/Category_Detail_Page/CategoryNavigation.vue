<template>
    <div>
        
    <div>
        <div class='container'>
            
            <li v-for='category in categories' v-bind:key='category.categoryID' id='categoryLinks' :class='category.name'>
              
              <!-- <router-link :to="{ name: 'category-details', params: {id: category.categoryID.toString()} }" tag='li' > -->
            <h2 v-on:click='emitId(category.categoryID)'> {{category.name}} </h2>
              <!-- </router-link> -->
             </li>
        </div>
        </div>
    </div>
</template>

<script>
import auth from '@/auth'
export default {
name: 'category-navigation',
data() {
    return {
        workouts: [],
        categories: [],
    }
},
props: {

},
methods:{

emitId(id){
  this.$emit('workoutIdChange', id)
}

},

 created() {
       fetch(`${process.env.VUE_APP_REMOTE_API}/api/categories`,{
         headers: {
           'Authorization' : 'Bearer ' + auth.getToken(),
         }
       })
      .then((response)=>{
        return response.json();
      })
      .then((json)=>{
       this.categories = json;
      })
  }
}

</script>

<style scoped>
.container{
  display: flex;
  align-items: center;
  justify-content: space-between;
  /* width: 90%; */
  margin: auto;
  
}
#categoryLinks{
   background-size: cover;
    background-color:#777;
    color: white;
    width: 15%;
    padding: 40px;
    border-radius:10px;
    display:block;
    text-align: center;
    list-style: none;
    font-size: 150%;
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
  .Strength{
    background-image: url("../../img/Strength.jpeg");  
  }
  .Cardio{
    background-image: url("../../img/cardio.jpeg"); 
  }
   .Flexibility{
    background-image: url("../../img/yoga.jpg");  
  }
    .Crossfit{
    background-image: url("../../img/crossfit.jpeg");   
  }
</style>

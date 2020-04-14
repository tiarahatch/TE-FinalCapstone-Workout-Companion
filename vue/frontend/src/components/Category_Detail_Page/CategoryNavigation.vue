<template>
    <div>
        
    <div>
        <div class='container'>
            
            <div v-on:click='emitId(category.categoryID)' v-for='category in categories' v-bind:key='category.categoryID' id='categoryLinks' :class='category.name'>
              

            <h2 > {{category.name}} </h2>

             </div>
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
  margin: auto;
  
  
}
#categoryLinks{
   background-size: cover;
   background-position: center;
    color: white;
    width: 15%;
    padding: 40px;
    border-radius:10px;
    display:block;
    text-align: center;
    font-size: 150%;
    cursor: pointer;
    transition: .6s;
}

  #categoryLinks:hover{
    width: 17%;
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
    
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

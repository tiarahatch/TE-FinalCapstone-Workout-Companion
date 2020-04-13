<template>
    <div>
        <nav>
          <router-link to='/dashboard' tag='button'>My Dashboard</router-link> 
          <router-link to='/premade-workouts' tag='button'>Choose Workout</router-link>
        </nav>
    <div>
        <ul class='container'>
            
            <li v-for='category in categories' v-bind:key='category.categoryID' :class='category.name'>
              <router-link :to="{ name: 'category-details', params: {id: category.categoryID.toString()} }" tag='li' class='container' >
            {{category.name}} 
              </router-link>
             </li>
        </ul>
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
       console.log(json);
      })
  }
}

</script>

<style scoped>
.container{
  display: flex;
  align-items: center;
  justify-content: center;
  width: 87%;
  margin: auto;
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
    background-size: cover;
    background-color:#777;
    color: white;
    width: 20%;
    margin: 2%;
    padding: 40px;
    border-radius:10px;
    border-width: 100%;
    display:block;
    align-items:center;
    justify-content:center;
    text-align: center;
  
  }
  
  .Cardio{
    background-image: url("../../img/cardio.jpeg");
    background-size: cover;
    background-color:#777;
    color: white;
    width: 20%;
    margin: 2%;
    padding: 40px;
    border-radius:10px;
    border-width: 100%;
    display:block;
    align-items:center;
    justify-content:center;
    text-align: center;
  
  }
   .Flexibility{
    background-image: url("../../img/yoga.jpg");
    background-size: cover;
    background-color:#777;
    color: white;
    width: 20%;
    margin: 2%;
    padding: 40px;
    border-radius:10px;
    border-width: 100%;
    display:block;
    align-items:center;
    justify-content:center;
    text-align: center;
  
  }
    .Crossfit{
    background-image: url("../../img/crossfit.jpeg");
    background-size: cover;
    background-color:#777;
    color: white;
    width: 20%;
    margin: 2%;
    padding: 40px;
    border-radius:10px;
    border-width: 100%;
    display:block;
    align-items:center;
    justify-content:center;
    text-align: center;
    
  
  }
</style>

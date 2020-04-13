<template>
    <div>
        <nav>
          <router-link to='/' tag='button'>Home</router-link> 
          <router-link to='/premade-workouts' tag='button'>Choose Workout</router-link>
        </nav>
    <div>
        <ul class='container'>
            
            <li v-for='category in categories' v-bind:key='category.categoryID' class='box'>
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
  .box{
    background-color:#777;
    color: #7ac1ff;
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

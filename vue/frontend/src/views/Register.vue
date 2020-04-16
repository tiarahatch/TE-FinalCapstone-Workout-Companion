<template>

 <div id="signup">
<h1 class="h3 mb-3 font-weight-normal">Sign-Up</h1>
<simple-modal v-model="isShow" title="Member Details" class="modal">
      <template slot="body">
        <new-user></new-user>
         
         <button> Sign Up </button>
      </template>
      <!-- <template slot="footer">
        <button>OK</button>
      </template> -->
    </simple-modal>

     
  <div id="register" class="text-center">
    
    <form class="form-register" @submit.prevent="register">
      <h1 class="h3 mb-3 font-weight-normal"></h1>
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        There were problems registering this user.
      </div>
      <label for="username" class="sr-only">Username</label><br>
      <input
        type="text"
        id="username"
        class="form-control"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
      /><br>
      <label for="password" class="sr-only">Password</label><br>
      <input
        type="password"
        id="password"
        class="form-control"
        placeholder="Password"
        v-model="user.password"
        required
      /><br>
      <input
        type="password"
        id="confirmPassword"
        class="form-control"
        placeholder="Confirm Password"
        v-model="user.confirmPassword"
        required
      /><br>
      <div class='account-create'>
      <router-link :to="{ name: 'login' }" class="login">Have an account?</router-link>
      
      <button class="btn btn-lg btn-primary btn-block"  @click="isShow = !isShow" type="submit">
        Create Account
      </button>
      </div>
    </form>
  </div>
   <div class="hero-image" >
  </div>
  </div>
 
</template>

<script>
import SimpleModal from 'simple-modal-vue'
import NewUser from '@/components/NewUser.vue'
export default {
  name: 'register',
  data() {
    return {
      isShow: false,
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
    };
  },
  components:{
    SimpleModal,
    NewUser,
  },
  methods: {
    register() {
      fetch(`${process.env.VUE_APP_REMOTE_API}/register`, {
        method: 'POST',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(this.user),
      })
        .then((response) => {
          if (response.ok) {
            this.$router.push({ path: '/login', query: { registration: 'success' } });
          } else {
            this.registrationErrors = true;
          }
        })

        .then((err) => console.error(err));
    },
  },
};
</script>

<style scoped>
button {
  text-align: center;
  font-family:  'Oswald', sans-serif;;
  font-weight: bold;
  font-size: 14px;
  margin-left: auto;
  margin-right: auto;
  margin-top: 2%;
  border: none;
  width: 200px;
  background-color: black;
  color: #7ac1ff;
  
}
.hero-image{
  background-image: url('../img/BackgroundImages/login2.jpg');
  padding:0;
  margin:0;  
  background-size: cover;
  width: 100%;
  min-height: 100vh;
  background-position: center;
  filter: grayscale(85%);
 position: absolute;
 top: -7.3%;
 z-index: -1000;
 
 
}
#signup{
  position: relative;
  font-family: "Black Ops One";
  text-align: center;
  color: #045499;
  font-size: 200%;
  -webkit-text-stroke: 1px rgb(226, 226, 226);
  top: 10%;
  justify-content: center;
}
.login {
  font-family:  'Oswald', sans-serif;
  color: #045499;
  -webkit-text-stroke: 1px rgb(226, 226, 226);
  font-size: 25px;

}
button {
  background-color: rgba(126, 126, 126, 0.75);
  height: 75%;
  width: 15%;
  font-size: 100%;
  box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  
  transition-duration: 0.6s;
  color: white;
}
button:hover {
  opacity: 0.9;
  width: 18%;
  background-color: rgb(177, 177, 177);
  box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);
}
.modal{
  font-size: 25px;
  font-family: 'Oswald', sans-serif;
}
.sr-only {
  font-family: 'Oswald', sans-serif;
}

.account-create {
  display: flex;
  flex-direction: column-reverse;
 align-items: center;
  
  width: 100%;
}

</style>

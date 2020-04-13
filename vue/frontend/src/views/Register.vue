<template>
 <div>

<simple-modal v-model="isShow" title="Class Description">
      <template slot="body">
        <new-user></new-user>
         
         <button> Sign Up </button>
      </template>
      <!-- <template slot="footer">
        <button>OK</button>
      </template> -->
    </simple-modal>

     <nav>
      <router-link to='/' tag='button'>Home</router-link>
      </nav>
  <div id="register" class="text-center">
    
    <form class="form-register" @submit.prevent="register">
      <h1 class="h3 mb-3 font-weight-normal"></h1>
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        There were problems registering this user.
      </div>
      <label for="username" class="sr-only">Username</label>
      <input
        type="text"
        id="username"
        class="form-control"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
      />
      <label for="password" class="sr-only">Password</label>
      <input
        type="password"
        id="password"
        class="form-control"
        placeholder="Password"
        v-model="user.password"
        required
      />
      <input
        type="password"
        id="confirmPassword"
        class="form-control"
        placeholder="Confirm Password"
        v-model="user.confirmPassword"
        required
      />
      <router-link :to="{ name: 'login' }">
        Have an account?
      </router-link>
      <button class="btn btn-lg btn-primary btn-block" @click="isShow = !isShow" type="submit">
        Create Account
      </button>
    </form>
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
   font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
  font-size: 14px;
  margin:95px;
  border: none;
  width: 200px;
  background-color: black;
  color: #7ac1ff;
  border-radius: 25px;
  opacity: .75;
} 

</style>

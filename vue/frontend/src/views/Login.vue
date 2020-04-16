<template>

 
  <div id="login">
      <div id='signin' class="text-center">
      <form class="form-signin" @submit.prevent="login">
        <h1 class="h3 mb-3 font-weight-normal">Log In</h1>
      <div class="alert alert-danger" role="alert" v-if="invalidCredentials">
        Invalid username and password!
      </div>
      <div class="alert alert-success" role="alert" v-if="this.$route.query.registration">
        Thank you for registering, please sign in.
      </div>
      <label for="username" class="sr-only">Username</label><br>
      <input
        type="text"
        id="username"
        class="fm-txt"
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
        />
     <div class="account-create" >
     
      <router-link :to="{ name: 'register' }" class="need-account">Need an account?</router-link>
      
      <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
    </div>
    </form>
  </div>
  <div class="hero-image">
    </div>
  </div>
</template>

<script>
import auth from '../auth';

export default {
  name: 'login',
  components: {},
  data() {
    return {
      user: {
        username: '',
        password: '',
      },
      invalidCredentials: false,
    };
  },
  methods: {
    login() {
      fetch(`${process.env.VUE_APP_REMOTE_API}/login`, {
        method: 'POST',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(this.user),
      })
        .then((response) => {
          if (response.ok) {
            return response.text();
          } else {
            this.invalidCredentials = true;
          }
        })
        .then((token) => {
          if (token != undefined) {
            if (token.includes('"')) {
              token = token.replace(/"/g, '');
            }
            auth.saveToken(token);
            this.$router.push('/dashboard');
          }
        })
        .catch((err) => console.error(err));
    },
  },
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Black+Ops+One&display=swap");

@import url("https://fonts.googleapis.com/css2?family=Oswald&display=swap");

#username{
  color:black;
  -webkit-text-stroke: 0;
}
#password{
  color:black;
  -webkit-text-stroke: 0;
}


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

}
.hero-image{
  background-image: url('../img/BackgroundImages/login2.jpg');
  padding:0;
  margin:0;  
  background-size: cover;
  width: 100%;
  min-height: 110vh;
  background-position: center;
  filter: grayscale(85%);
 position: absolute;
 top: -7.3%;
 z-index: -1000;
}
#signin{
  position: fixed;
  font-family: "Black Ops One";
  text-align: center;
  z-index: 1000;
  color: #045499;
  font-size: 200%;
  -webkit-text-stroke: 1px rgb(226, 226, 226);
  margin-top: 15%;
  left: 50%;
  transform: translate(-50%, -50%);
 
}
.sr-only {
  font-family: 'Oswald', sans-serif;
}
.need-account{
  font-family: 'Oswald', sans-serif;
  color: #045499;
  -webkit-text-stroke: 1px rgb(226, 226, 226);
  font-size: 25px;
}
button {
background-color: rgba(126, 126, 126, 0.75);
  height: 75%;
  width: 95%;
  font-size: 100%;
  box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  transition-duration: 0.6s;
  color: white;
  margin: 0;
  margin-top: 2%;
}
button:hover {
  opacity: 0.9;
  width: 96%;
  background-color: rgb(177, 177, 177);
  box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);
}
.account-create {
  display: flex;
  flex-direction: column-reverse;
 align-items: center;
  
  width: 100%;
}


</style>

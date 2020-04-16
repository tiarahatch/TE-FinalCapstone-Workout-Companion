<template>
  <div id="wholepage">
    <div class="navButtons">
      <button v-on:click="logout">LogOut</button>
    </div>

    <h1 id="dashboardHeader">MY DASHBOARD</h1>
    <!-- <h2 id="welcomeMessage">Welcome Back</h2> -->
    <div id="dashboard">
      <div class="topRow">
        <div class="side">
          <router-link to="/category-details" tag="button">Choose Workout</router-link>

          <router-link to="/schedule" tag="button">Sign Up for Class</router-link>

          <router-link to="/NewUser" tag="button">Edit Profile</router-link>

          <button>My Metrics</button>
        </div>

        <category-percentage id="Doughnut"></category-percentage>

        <div class="images">
          <img src="../img/motivation.jpg" class="quote" />
        </div>
      </div>

      <workout-consistancy id="line"></workout-consistancy>

    </div>

  </div>
</template>


<script>
import auth from "@/auth";
import CategoryPercentage from "@/components/PieChart.vue";
import WorkoutConsistancy from "@/components/LineChart.vue";
export default {
  components: {
    CategoryPercentage,
    WorkoutConsistancy
  },
  methods: {
    logout() {
      auth.logout();
      localStorage.removeItem("Authorization");
      this.$router.go("/");
    }
  }
};
</script>
 

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Black+Ops+One&display=swap");
@import url("https://fonts.googleapis.com/css2?family=Oswald&display=swap");

#dashboard{
    background-color:rgb(211, 211, 211);
    display: flex;
    flex-direction: column;
    width: 90%;
    /* height: 100%; */
    margin: auto;
    margin-bottom:2%;
    border-radius: 10px;
    padding-bottom: 5%;
    padding-top:2%;
}

.topRow {
  display: flex;
  width: 80%;
  margin-left: auto;
  margin-right: auto;
  justify-content: space-between;
  /* background-color: yellow; */
}
#Doughnut {
  width: 30%;
  /* background-color:green; */
}
#line{
    height:30%;
    width:80%;
    margin-left:auto;
    margin-right:auto;
    margin-top: 2%;
}
.images {
  display: flex;
  width: 30%;
  align-items: center;
  /* background-color:pink; */
}
.quote {
  border-radius: 5px;
  width: 100%;
  height: 90%;
}

#wholepage {
  padding: 0;
  margin: 0;
  width: 100%;
  min-height: 150vh;
  background-image: url("../img/workoutBackground4.png");
}

#dashboardHeader {
  text-align: center;
  font-family: "Black Ops One";
  color: white;
  font-size: 300%;
}
#welcomeMessage {
  text-align: center;
  font-family: "Black Ops One";
  color: white;

  margin: 10px;
}
.side {
  /* background-color:red; */
  width: 30%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-between;
}
.side button {
  text-align: center;
  font-size: 100%;
  border: none;
  height: 20%;
  width: 98%;
  background-color: rgba(0, 0, 0, 0.5);
  color: white;
  border-radius: 5px;

  transition: 0.6s;
}

.side button:hover {
  height: 21%;
  width: 99%;
  cursor: pointer;
  background-color: rgba(0, 0, 0, 0.75);
  box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.2),
    0 17px 50px 0 rgba(0, 0, 0, 0.15);
}

.navButtons {
  display: flex;
  justify-content: flex-end;
  margin-bottom: 1%;
}
.navButtons button {
  width: 10%;
  height: 30px;
  background-color: rgba(0, 0, 0, 0.5);
  color: white;
  font-family: "Oswald", sans-serif;
  border: none;
  transition: 0.6s;
}

.navButtons button:hover {
  width: 12%;
  height: 30px;
  cursor: pointer;
  background-color: rgba(0, 0, 0, 0.75);
  box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);
}
</style>

<template>
  <div id="body">
    
    
    <div class="categoryName">{{categories[id - 1].name.toUpperCase()}}</div>

    <div id="workoutList">
      <!-- <li v-for="item in workoutLists" v-bind:key="item.workoutID"> -->

      <button
        class="workoutButtons"
        v-for="item in workoutLists"
        v-bind:key="item.workoutID"
        v-on:click="fetchExercises(item.workoutID)"
      >{{item.name}}</button>

      <!-- </li> -->
    </div>
  </div>
</template>

<script>
import auth from "@/auth";
export default {
  name: "category-workouts",
  components: {},
  data() {
    return {
      categories: [],
      workouts: []
    };
  },
  props: {
    id: { type: String },
    workoutLists: { type: Array }
  },
  computed: {
    categoryName: function() {
      return this.categories[this.id - 1].name;
    }
  },

  methods: {
    fetchExercises(id) {
      fetch(`${process.env.VUE_APP_REMOTE_API}/api/exercise/${id}`, {
        method: "GET",
        headers: {
          Authorization: "Bearer " + auth.getToken(),
          "Content-Type": "application/json"
        }
      })
        .then(response => {
          return response.json();
        })
        .then(json => {
          this.$emit("exerciseEmit", json);
        });
    }
  },

  beforeUpdate() {
    this.fetchExercises(this.workoutLists[0].workoutID);
  },

  //get names of workout in category and list of categories to print name from.
  created() {
    fetch(`${process.env.VUE_APP_REMOTE_API}/api/categories`, {
      headers: {
        Authorization: "Bearer " + auth.getToken()
      }
    })
      .then(response => {
        return response.json();
      })
      .then(json => {
        this.categories = json;
      });
  }
};
</script>


<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Black+Ops+One&display=swap');

@import url('https://fonts.googleapis.com/css2?family=Oswald&display=swap');

* { 
  font-family: 'Oswald', sans-serif;
}

#body {
  height: 400px;
  display: flex;
  flex-direction: column;
  align-items: center;
  
}

#workoutList {
  width: 100%;
  height: 75%;
  margin: auto;
  list-style: none;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: space-around;
}

.workoutButtons {
  text-align: center;
  font-size: 100%;
  border: none;
  height: 25%;
  width: 65%;
  background-color: rgba(0, 0, 0, 0.5);
  color: white;
  border-radius: 8px;

  

  transition: 0.6s;
}

.workoutButtons:hover {
  height: 30%;
  width: 70%;
  cursor: pointer;
  background-color: rgba(0, 0, 0, 0.75);
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}

.categoryName {
  margin-top: 5%;
  color: white;

  font-size: 200%;
  width: 70%;
  height: 20%;
  padding-top: 7%;
  text-align: center;
  /* font-family: 'Black Ops One'; */

  background-color: black;
}
</style>

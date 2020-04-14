import Vue from 'vue'
import Router from 'vue-router'
import auth from './auth'
import Home from './views/Home.vue'
import Login from './views/Login.vue'
import Register from './views/Register.vue'
import PremadeWorkouts from './views/PremadeWorkouts.vue'
import Schedule from './views/Schedule.vue'
import CategoryDetails from './views/CategoryDetails.vue'
import Dashboard from './views/Dashboard.vue'
import StartWorkout from './views/StartWorkout.vue'
import EndWorkout from './views/EndWorkout.vue'

Vue.use(Router)

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
      meta: {
        requiresAuth: false //This was changed to move past login 
      }
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/premade-workouts",
      name: "premade-workouts",
      component: PremadeWorkouts,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/schedule",
      name: "schedule",
      component: Schedule,
      meta: {
        requiresAuth: false
      },
     
    },
    {
      path: "/category-details/:id",
      name: "category-details",
      component: CategoryDetails,
      props: 
        true,
      
      meta: {
        requiresAuth: true
      }
    },
    
    {
      path: "/dashboard",
      name: "dashboard",
      component: Dashboard,
      
      
      meta: {
        requiresAuth: true
      },
    },
    {
      path: "/StartWorkout",
      name: "startworkout",
      component: StartWorkout,
      props: true,
      
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/EndWorkout",
      name: "endWorkout",
      component: EndWorkout,
      meta: {
        requiresAuth: false
      }
    },
   


  ]
})

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);
  const user = auth.getUser();

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && !user) {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;

<template>
<div>
    <div class = "categoryNav">
    <category-navigation></category-navigation>
    </div>
    <div class = "mainBody">
    <!-- emit exercises[] from category-workouts -->
    <category-workouts v-bind:id = 'this.id' v-bind:workouts = 'this.workouts' v-on:exerciseEmit="exercises=$event" class = "categoryWorkouts" ></category-workouts>
    <!-- push in exercies[] that was pulled from cat-workouts -->
    <workouts-exercises v-bind:exercises = 'exercises' class = "workoutExercises"></workouts-exercises>
    </div>
</div>
</template>

<script>

import CategoryNavigation from '@/components/Category_Detail_Page/CategoryNavigation.vue'
import CategoryWorkouts from '@/components/Category_Detail_Page/CategoryWorkouts.vue'
import WorkoutsExercises from '@/components/Category_Detail_Page/WorkoutsExercises.vue'

export default {

    data(){
        return{
            exercises: [],


        };
    },
    
    props: {
        id: {type: String},
        // id: {
        //     type: Number,
        //     required: false,
        // }
        workouts: {type:Array},
        
    },
    name: 'category-details',
    components: {
        CategoryNavigation,
        CategoryWorkouts,
        WorkoutsExercises,
        
    },
}
</script>

<style>
.mainBody{
    display: flex;
}
</style>

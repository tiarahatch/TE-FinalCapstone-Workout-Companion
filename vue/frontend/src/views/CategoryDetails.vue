<template>
<div>
    <category-navigation></category-navigation>
    <category-workouts v-bind:id = 'this.id' v-bind:workouts = 'this.workouts'></category-workouts>
    <workouts-exercises v-bind:exercises1 = 'exercises1' v-bind:exerises2 = 'exercises2' v-bind:exercises3 = 'exercises3'></workouts-exercises>
</div>
</template>

<script>

import CategoryNavigation from '@/components/Category_Detail_Page/CategoryNavigation.vue'
import CategoryWorkouts from '@/components/Category_Detail_Page/CategoryWorkouts.vue'
import WorkoutsExercises from '@/components/Category_Detail_Page/WorkoutsExercises.vue'

export default {

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

</style>

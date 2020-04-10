<template>
<div>
    <category-navigation></category-navigation>
    <category-workouts v-bind:id = 'this.id'></category-workouts>
</div>
</template>

<script>

import CategoryNavigation from '@/components/Category_Detail_Page/CategoryNavigation.vue'
import CategoryWorkouts from '@/components/Category_Detail_Page/CategoryWorkouts.vue'

export default {

    props: {
        id: {
            type: Number,
            required: false,
        }
    },
    name: 'category-details',
    components: {
        CategoryNavigation,
        CategoryWorkouts,
    },
}
</script>

<style>

</style>

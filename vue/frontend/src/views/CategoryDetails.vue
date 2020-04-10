<template>
<div>
    <category-navigation></category-navigation>
    <category-workouts></category-workouts>
</div>
</template>

<script>

import CategoryNavigation from '@/components/Category_Detail_Page/CategoryNavigation.vue'
import CategoryWorkouts from '@/components/Category_Detail_Page/CategoryWorkouts.vue'

export default {
    name: 'category-details',
    components: {
        CategoryNavigation,
        CategoryWorkouts,
    },
}
</script>

<style>

</style>

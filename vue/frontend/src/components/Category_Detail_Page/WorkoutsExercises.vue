<template>
    <div>
        
        <ul>
            <li v-for='item in exercises' v-bind:key='item.exerciseID'>
                {{item.name}}
            </li>
        </ul>
    </div>
</template>

<script>
export default {
    props: {
       
        exercises: {type:Array},
        
    },
name: 'workout-exercises',


}
</script>

<style>

</style>

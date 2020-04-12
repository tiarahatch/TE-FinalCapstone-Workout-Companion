<template>
    <div>
        <ul>
            <li v-for='exercise1 in exercises1' v-bind:key='exercise1.exerciseID'>
                {{exercise1.name}}
            </li>
        </ul>
        <ul>
            <li v-for='exercise2 in exercises2' v-bind:key='exercise2.exerciseID'>
                {{exercise2.name}}
            </li>
        </ul>
        <ul>
            <li v-for='exercise3 in exercises3' v-bind:key='exercise3.exerciseID'>
                {{exercise3.name}}
            </li>
        </ul>
    </div>
</template>

<script>
export default {
    props: {
        exercises1: {type:Array},
        exercises2: {type:Array},
        exercises3: {type:Array},
    },
name: 'workout-exercises',


}
</script>

<style>

</style>

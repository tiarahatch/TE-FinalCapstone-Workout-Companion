<script>
import {Doughnut} from 'vue-chartjs'
export default {
extends: Doughnut,
name: 'category-pecentage',
    data: () => ({
        chartdata: {
            labels: ['Cardio', 'Strength', 'Flexibility', 'CrossFit'],
            datasets: [
                {
                    label: 'Data',
                    data: [40, 20, 20, 20],
                    backgroundColor: [
                        '#022a4d',
                        '#045499',
                        '#7ba4d4',
                        '#4c9bf5'
                    ]
                },
         
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false
        }
    }),
mounted() {
    this.renderChart(this.chartdata, this.options)
    }
}
</script>

<style>

</style>




getWeekDay(date) {
    let weekdays = new Array
}
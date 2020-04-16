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
                        '#000000',
                        '#d3d3d3'
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

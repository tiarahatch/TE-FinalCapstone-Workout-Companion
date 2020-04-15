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
                        '#f57ff5',
                        '#678fcf',
                        '#62d962',
                        '#ed9880'
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

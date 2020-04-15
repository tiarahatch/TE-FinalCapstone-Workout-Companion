<script>
import {Line} from 'vue-chartjs'

export default {

extends: Line,
name: 'workout-consistancy',
    data: () => ({
        chartdata: {
            labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
            datasets: [
                {
                    label: 'Completed Workouts',
                    data: [1, 3, 2, 5, 0, 6, 4, 7, 2, 0, 1, 2],
                    pointBackgroundColor: '#ffffff',
                    pointBorderColor: '#045499',
                    borderColor: '#000000',
                    backgroundColor: '#045499',
                    pointRadius: 5,
                       
                    
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

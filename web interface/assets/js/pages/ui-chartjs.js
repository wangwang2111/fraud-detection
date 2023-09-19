
var chartColors = {
    red: 'rgb(255, 99, 132)',
    orange: 'rgb(255, 159, 64)',
    yellow: 'rgb(255, 205, 86)',
    green: 'rgb(75, 192, 192)',
    info: '#41B1F9',
    blue: '#3245D1',
    purple: 'rgb(153, 102, 255)',
    grey: '#EBEFF6'
};

var config1 = {
    type: "line",
    data: {
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [
            {
                label: "Balance",
                backgroundColor: "#fff",
                borderColor: "#fff",
                data: [20, 40, 20, 70, 10, 50, 20],
                fill: false,
                pointBorderWidth: 100,
                pointBorderColor: "transparent",
                pointRadius: 3,
                pointBackgroundColor: "transparent",
                pointHoverBackgroundColor: "rgba(63,82,227,1)",
            },
        ],
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        layout: {
            padding: {
                left: -10,
                top: 10,
            },
        },
        legend: {
            display: false,
        },
        title: {
            display: false,
        },
        tooltips: {
            mode: "index",
            intersect: false,
        },
        hover: {
            mode: "nearest",
            intersect: true,
        },
        scales: {
            xAxes: [
                {
                    gridLines: {
                        drawBorder: false,
                        display: false,
                    },
                    ticks: {
                        display: false,
                    },
                },
            ],
            yAxes: [
                {
                    gridLines: {
                        display: false,
                        drawBorder: false,
                    },
                    ticks: {
                        display: false,
                    },
                },
            ],
        },
    },
};
var config2 = {
    type: "line",
    data: {
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [
            {
                label: "Revenue",
                backgroundColor: "#fff",
                borderColor: "#fff",
                data: [20, 800, 300, 400, 10, 50, 20],
                fill: false,
                pointBorderWidth: 100,
                pointBorderColor: "transparent",
                pointRadius: 3,
                pointBackgroundColor: "transparent",
                pointHoverBackgroundColor: "rgba(63,82,227,1)",
            },
        ],
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        layout: {
            padding: {
                left: -10,
                top: 10,
            },
        },
        legend: {
            display: false,
        },
        title: {
            display: false,
        },
        tooltips: {
            mode: "index",
            intersect: false,
        },
        hover: {
            mode: "nearest",
            intersect: true,
        },
        scales: {
            xAxes: [
                {
                    gridLines: {
                        drawBorder: false,
                        display: false,
                    },
                    ticks: {
                        display: false,
                    },
                },
            ],
            yAxes: [
                {
                    gridLines: {
                        display: false,
                        drawBorder: false,
                    },
                    ticks: {
                        display: false,
                    },
                },
            ],
        },
    },
};
var config3 = {
    type: "line",
    data: {
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [
            {
                label: "Orders",
                backgroundColor: "#fff",
                borderColor: "#fff",
                data: [20, 40, 20, 200, 10, 540, 723],
                fill: false,
                pointBorderWidth: 100,
                pointBorderColor: "transparent",
                pointRadius: 3,
                pointBackgroundColor: "transparent",
                pointHoverBackgroundColor: "rgba(63,82,227,1)",
            },
        ],
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        layout: {
            padding: {
                left: -10,
                top: 10,
            },
        },
        legend: {
            display: false,
        },
        title: {
            display: false,
            text: "Chart.js Line Chart",
        },
        tooltips: {
            mode: "index",
            intersect: false,
        },
        hover: {
            mode: "nearest",
            intersect: true,
        },
        scales: {
            xAxes: [
                {
                    gridLines: {
                        drawBorder: false,
                        display: false,
                    },
                    ticks: {
                        display: false,
                    },
                },
            ],
            yAxes: [
                {
                    gridLines: {
                        display: false,
                        drawBorder: false,
                    },
                    ticks: {
                        display: false,
                    },
                },
            ],
        },
    },
};
var config4 = {
    type: "line",
    data: {
        labels: ["January", "February", "March", "April", "May", "June", "July"],
        datasets: [
            {
                label: "My First dataset",
                backgroundColor: "#fff",
                borderColor: "#fff",
                data: [20, 40, 20, 70, 10, 5, 23],
                fill: false,
                pointBorderWidth: 100,
                pointBorderColor: "transparent",
                pointRadius: 3,
                pointBackgroundColor: "transparent",
                pointHoverBackgroundColor: "rgba(63,82,227,1)",
            },
        ],
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        layout: {
            padding: {
                left: -10,
                top: 10,
            },
        },
        legend: {
            display: false,
        },
        title: {
            display: false,
            text: "Chart.js Line Chart",
        },
        tooltips: {
            mode: "index",
            intersect: false,
        },
        hover: {
            mode: "nearest",
            intersect: true,
        },
        scales: {
            xAxes: [
                {
                    gridLines: {
                        drawBorder: false,
                        display: false,
                    },
                    ticks: {
                        display: false,
                    },
                },
            ],
            yAxes: [
                {
                    gridLines: {
                        display: false,
                        drawBorder: false,
                    },
                    ticks: {
                        display: false,
                    },
                },
            ],
        },
    },
};


var ctxBar = document.getElementById("bar").getContext("2d");
var myPie = new Chart(ctxBar, {
    type: 'pie',
    data: {
        labels: ['Fraud Transactions', 'Normal Transactions'],
        datasets: [{
            label: 'Proportion',
            data: [16604, 31426],
            backgroundColor: [
                'rgba(255, 99, 132, 0.5)',
                'rgba(54, 162, 235, 0.5)'
            ],
        }]
    }
});

list0 = [[393,363,457,35,36,55,49,49,40,65,70,119],[63,50,97,89,94,84,92,89,102,135,119,2598],[1214,344,606,548,598,554,734,790,867,1372,733,1213]]
list1 = [[207,183,243,17,33,19,20,17,27,34,41,77],[43,25,53,45,40,44,60,48,33,58,43,1396],[721,208,342,305,320,309,412,414,448,675,404,628]]
for (var i = 0; i <= 2; i++) {
    j = i+1;
    var line = document.getElementById('line' + j).getContext('2d');
    var gradient = line.createLinearGradient(0, 0, 0, 400);
    gradient.addColorStop(0, 'rgba(50, 69, 209,1)');
    gradient.addColorStop(1, 'rgba(265, 177, 249,0)');
    
    var gradient2 = line.createLinearGradient(0, 0, 0, 400);
    gradient2.addColorStop(0, 'rgba(255, 91, 92,1)');
    gradient2.addColorStop(1, 'rgba(265, 177, 249,0)');
    var myline = new Chart(line, {
        type: 'line',
        data: {
            labels: ['January','February','March','April','May','June','July','August','September','October','November','December'],
            datasets: [{
                label: 'Normal',
                data: list0[i],
                backgroundColor: "rgba(54, 162, 235, 0.5)",
                borderWidth: 3,
                borderColor: 'rgba(54, 162, 235, 0.5)',
                pointBorderWidth: 0,
                pointBorderColor: 'transparent',
                pointRadius: 3,
                pointBackgroundColor: 'transparent',
                pointHoverBackgroundColor: 'rgba(54, 162, 235, 0.5)',
            }, {
                label: 'Fraud',
                data: list1[i],
                backgroundColor: "rgba(255, 99, 132, 0.5)",
                borderWidth: 3,
                    borderColor: 'rgba(255, 99, 132, 0.5)',
                pointBorderWidth: 0,
                pointBorderColor: 'transparent',
                pointRadius: 3,
                pointBackgroundColor: 'transparent',
                pointHoverBackgroundColor: 'rgba(255, 99, 132, 0.5)',
            }]
        },
        options: {
            responsive: true,
            layout: {
                padding: {
                    top: 10,
                },
            },
            tooltips: {
                intersect: false,
                titleFontFamily: 'Helvetica',
                titleMarginBottom: 10,
                xPadding: 10,
                yPadding: 10,
                cornerRadius: 3,
            },
            legend: {
                display: true,
            },
            scales: {
                yAxes: [
                    {
                        gridLines: {
                            display: true,
                            drawBorder: true,
                        },
                        ticks: {
                            display: true,
                        },
                    },
                ],
                xAxes: [
                    {
                        gridLines: {
                            drawBorder: false,
                            display: false,
                        },
                        ticks: {
                            display: true,
                        },
                    },
                ],
            },
        }
    });
}
list0value = [[989005334,860696818,1107198792,132636953,112381308,193332441,145000020,163950880,110174735,209882100,231284333,340116430],
            [172431719,164837500,302977874,271192737,331238467,258194206,326848959,320739335,344775967,473762229,435282165,11193692352],
            [5024639371,1207486176,2191956930,1848822064,2035718102,1984664289,2540734157,2795672405,3188034461,5213894666,2428040018,4647463606]]
list1value = [[532104653,458109612,564435380,56047318,106640375,60292000,58782668,62321385,83665800,105601112,116972229,193447978],
            [149941925,75582604,186666470,145479802,127932417,147827270,203292562,166972287,106578770,224651791,154377284,6025942267],
            [2884520116,718465080,1149948050,1032760622,1071768131,1081906153,1458266660,1419186482,1632743831,2568268760,1322485535,2293034869]]
for (var i=0; i <=2; i++) {
    var areaOptions = {
        series: [
        {
            name: "normal",
            data: list0value[i],
        },
        {
            name: "fraud",
            data: list1value[i],
        },
        ],
        chart: {
        height: 350,
        type: "area",
        },
        dataLabels: {
        enabled: false,
        },
        stroke: {
        curve: "smooth",
        },
        xaxis: {
        type: "month",
        categories: ['January','February','March','April','May','June','July','August','September','October','November','December'],
        },
        tooltip: {
            ticks: {
                beginAtZero:true,
                userCallback: function(value, index, values) {
                    value = value.toString();
                    value = value.split(/(?=(?:...)*$)/);
                    value = value.join(',');
                    return value;
                }
            },
        x: {
            ticks: {
                display: true,
            }
        },
        },
    };
    j = i+1;
    var area = new ApexCharts(document.querySelector("#area"+j), areaOptions);
    area.render();
}
// let ctx1 = document.getElementById("canvas1").getContext("2d");
// let ctx2 = document.getElementById("canvas2").getContext("2d");
// let ctx3 = document.getElementById("canvas3").getContext("2d");
// let ctx4 = document.getElementById("canvas4").getContext("2d");
// var lineChart1 = new Chart(ctx1, config1);
// var lineChart2 = new Chart(ctx2, config2);
// var lineChart3 = new Chart(ctx3, config3);
// var lineChart4 = new Chart(ctx4, config4);

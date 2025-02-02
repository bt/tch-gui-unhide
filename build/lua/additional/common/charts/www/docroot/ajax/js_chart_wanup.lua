--pretranslated: do not change this file

ngx.header.content_type = 'application/javascript';
local rgb = ngx.req.get_uri_args()["rgb"]

ngx.print('\
var wanup_context = document.getElementById("wanup_canvas").getContext("2d");\
var wanup_config = {\
  type: "line",\
  data: {\
    labels: [60,58,56,54,52,50,48,46,44,42,40,38,36,34,32,30,28,26,24,22,20,18,16,14,12,10,8,6,4,2],\
    datasets: [{\
      borderWidth: 1,\
      borderColor: "rgb('); ngx.print(rgb); ngx.print(')",\
      backgroundColor: "rgb('); ngx.print(rgb); ngx.print(',0.25)",\
      data: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],\
      fill: true,\
      pointRadius: 0\
    }]\
  },\
  options: {\
    responsive: true,\
    maintainAspectRatio: false,\
    legend: {\
      display: false\
    },\
    scales: {\
      xAxes: [{\
        display: false\
      }],\
      yAxes: [{\
        display: false,\
        ticks: {\
          min: 0\
        }\
      }]\
    }\
  }\
};\
var wanup_data = sessionStorage.getItem("wanup_data");\
if (wanup_data != null) {\
  var arr = JSON.parse(wanup_data);\
  for (let i = 0; i < arr.length; i++) {\
    wanup_config.data.datasets[0].data[i] = Number(arr[i]);\
  }\
}\
window.wanup_chart = new Chart(wanup_context, wanup_config);\
');

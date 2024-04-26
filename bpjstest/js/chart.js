const xArray = [55, 90, 44];
const yArray = ["januari ", "agustus ", "november " ];

const data = [{
  x:xArray,
  y:yArray,
  type:"bar",
  orientation:"h",
  marker: {color:"rgba(88, 242, 121, 0.8)"}
}];

const layout = {title:"Pengembangan saldo 2021"};

Plotly.newPlot("myPlot1", data, layout);
Plotly.newPlot("myPlot2", data, layout);
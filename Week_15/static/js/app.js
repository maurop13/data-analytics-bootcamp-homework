function buildMetadata(sample) {

  // @TODO: Complete the following function that builds the metadata panel
    console.log(sample);
  // Use `d3.json` to fetch the metadata for a sample
    // Use d3 to select the panel with id of `#sample-metadata`
    var sampledatabase = d3.select("#sample-metadata");
    // Use `.html("") to clear any existing metadata
    var sampledata = sampledatabase.html("");
    console.log(sampledata);
    console.log("hello");
    // Use `Object.entries` to add each key and value pair to the panel
    d3.json(`/metadata/${sample}`).then((s) => {Object.entries(s).forEach(
      function([key,value]) 
        {
          sampledatabase.append("p").text(`${key}: ${value}`);
        })
  });
          
    // Hint: Inside the loop, you will need to use d3 to append new
    // tags for each key-value in the metadata.

    // BONUS: Build the Gauge Chart
    // buildGauge(data.WFREQ);
}

function buildCharts(sample) {
  var labelspie = [];
  var piedata = [];
  var texth =[];
  // @TODO: Use `d3.json` to fetch the sample data for the plots
  d3.json(`/samples/${sample}`).then(
            (s)=>
          { function buildpie(){
          labelspie = s.otu_ids.slice(0,10);
          piedata = s.sample_values.slice(0,10);
          texth = s.otu_labels.slice(0,10);
          var trace1 = {
                labels:labelspie,
                values:piedata,
                hoverinfo:texth,
                type:"pie"
              }
          var pdata = [trace1];
          var layout = {
              title:`Pie chart for ${sample}`
            }
          Plotly.newPlot("pie",pdata,layout)

              
          };
          function buildbubble(){
            xvalues = s.otu_ids;
            yvalues = s.sample_values;
            markersize= s.sample_values;
            markercolors = s.otu_ids;
            textvalues = s.otu_labels;
            
            // var trace2 = {
            //       x:xvalues,
            //       values:yvalues,
            //       hoverinfo:markersize,
            //       :markercolors;
            //       textvalues;
            //       type:"bubble"
            //     }
            trace2 = {
                x:xvalues,
                y:yvalues,  
                text : textvalues,
                mode:'markers',
                marker:{
                    size:markersize,
                    color: markercolors
                  }
              
                };
              console.log("this");
              console.log(trace2);
              console.log("that");
            var layout2 = {
                title:`Bubble chart for ${sample}`
              }
            Plotly.newPlot("bubble",[trace2],layout2)
          }

          buildpie();
          buildbubble();
        }
        )
  
    
    // @TODO: Build a Bubble Chart using the sample data

    // @TODO: Build a Pie Chart
    // HINT: You will need to use slice() to grab the top 10 sample_values,
    // otu_ids, and labels (10 each).
}

function init() {
  // Grab a reference to the dropdown select element
  var selector = d3.select("#selDataset");

  // Use the list of sample names to populate the select options
  d3.json("/names").then((sampleNames) => {
    sampleNames.forEach((sample) => {
      selector
        .append("option")
        .text(sample)
        .property("value", sample);
    });

    // Use the first sample from the list to build the initial plots
    const firstSample = sampleNames[0];
    buildCharts(firstSample);
    buildMetadata(firstSample);
  });
}

function optionChanged(newSample) {
  // Fetch new data each time a new sample is selected
  buildCharts(newSample);
  buildMetadata(newSample);
}

// Initialize the dashboard
init();

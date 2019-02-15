// @TODO: YOUR CODE HERE!

var svgWidth = 960;
var svgHeight = 660;

var margin = {
  top: 30,
  right: 30,
  bottom: 30,
  left: 30
};

var width = svgWidth - margin.left - margin.right;
var height = svgHeight - margin.top - margin.bottom;

var svg = d3
  .select("#scatter")
  .append("svg")
  .attr("height", svgHeight)
  .attr("width", svgWidth);

var chartGroup = svg.append("g")
  .attr("transform", `translate(${margin.left}, ${margin.top})`);


d3.csv("assets/data/data.csv").then(function(stateData) {

  // Log an error if one exists
  // if (error) return console.warn(error);

  // Print the stateData
  console.log(stateData);
  // Cast the hours value to a number for each piece of tvData
  stateData.forEach(function(data) {
    data.state = data.state;
    data.abbri =data.abbri; 
    data.poverty =+data.poverty;
    data.povertyMoe =+data.povertyMoe;
    data.age=+data.age;
    data.ageMoe=+data.ageMoe;
    data.income =+data.income;
    data.incomeMoe =+data.incomeMoe;
    data.healthcare= +data.healthcare;
    data.healthcareLow = +data.healthcareLow;
    data.healthcareHigh =+data.healthcareHigh; 
    data.obesity = +data.obesity;
    data.obesityLow = +data.obesityLow;
    data.obesityHigh = +data.obesityHigh;
    data.smokes = +data.smokes;
    data.smokesLow = +data.smokesLow;
    data.smokesHigh= +data.smokesHigh;
  });

  	console.log(stateData);
     var xLinearScale = d3.scaleLinear()
      .domain([8, d3.max(stateData, d => d.poverty)])
      .range([0, width]);

    var yLinearScale = d3.scaleLinear()
      .domain([0, d3.max(stateData, d => d.healthcare)])
      .range([height, 0]);

	var bottomAxis = d3.axisBottom(xLinearScale);
    var leftAxis = d3.axisLeft(yLinearScale);

    chartGroup.append("g")
      .attr("transform", `translate(0, ${height})`)
      .call(bottomAxis);

    chartGroup.append("g")
      .call(leftAxis);

    var circlesGroup = chartGroup.selectAll("circle")
	    .data(stateData)
	    .enter();

    circlesGroup
	    .append("circle")
	    .attr("cx", d => xLinearScale(d.poverty))
	    .attr("cy", d => yLinearScale(d.healthcare))
	    .attr("r", "15")
	    .attr("fill", "blue")
	    .attr("opacity", ".5");
    
	circlesGroup
	    .append("text")
	    .attr("x", d => xLinearScale(d.poverty))
	    .attr("y", d => yLinearScale(d.healthcare))
	    .attr("text-anchor","middle")
	    .attr("stroke","white")
	    .text(d => d.abbri);
  // var trace1 = 

});
// from data.js
var tableData = data;

// YOUR CODE HERE!
var filterbutton = d3.select("#filter-btn");
var tbody = d3.select("tbody");
console.log(tbody);
filterbutton.on("click", function() {

  // Prevents the page from refreshing
  d3.event.preventDefault();

  // deletes whatever there is in the tableData
  if (!(tbody.text()==="")){
  	tbody.text("");
  }
 // Select the date the user input
  var userInput = d3.select("#datetime");
  console.log(userInput);
  // Get the value property of the input element
  var inputValue = userInput.property("value");
  console.log(inputValue);

  var filteredData = tableData.filter(sighting => sighting.datetime===inputValue);

  console.log(filteredData);

  filteredData.forEach((filtered) => {
  	var row = tbody.append("tr");
  	Object.entries(filtered).forEach(([key,value])=>{
  		var cell = tbody.append("td");
  		cell.text(value);
  	})
  })


})
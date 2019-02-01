// from data.js
var tableData = data;

// YOUR CODE HERE!
var filterbutton = d3.select("#filter-btn");
var tbody = d3.select("tbody");
var userSelection = d3.select("#selType");
var userSelected = "Date"
console.log(tbody);

userSelection.on("change", function(){
  console.log(this.value);
  d3.select("#datetime").node().value="";
  switch(this.value) {
    case "Date/Time":
    d3.select("#selection-label").text("Insert Date");
    d3.select("#datetime").attr("placeholder","1/1/2010");
    userSelected="Date";
    break;
    case "City":
    d3.select("#selection-label").text("Insert City");
    d3.select("#datetime").attr("placeholder", "reedville");
    userSelected="City";
    break;
    case "State":
    d3.select("#selection-label").text("Insert state");
    d3.select("#datetime").attr("placeholder", "ca");
    userSelected="State";
    break;
    case "Country":
    d3.select("#selection-label").text("Insert country");
    d3.select("#datetime").attr("placeholder","us");
    userSelected="Country";
    break;
    case "Shape":
    d3.select("#selection-label").text("Insert shape");
    d3.select("#datetime").attr("placeholder","flash");
    userSelected="Shape";
    break;
    default:
    d3.select("#selection-label").text("Insert Date");
    d3.select("#datetime").placeholder = "1/1/2010";
    userSelected="Date";
    break;
  }

})

function filterData (action, invalue){
      if(action === "Date"){
            return tableData.filter(sighting => sighting.datetime===invalue);
          }
      else if(action ==="City"){
            return tableData.filter(sighting => sighting.city===invalue);
          }
          
      else if(action === "State"){
            return tableData.filter(sighting => sighting.state===invalue);
          }
      else if(action === "Country"){
            return tableData.filter(sighting => sighting.country===invalue);
          }
      else if(action === "Shape"){
            return tableData.filter(sighting => sighting.shape===invalue);
          }
      }

filterbutton.on("click", function() {

  // Prevents the page from refreshing
  d3.event.preventDefault();

  // deletes whatever there is in the tableData
  if (!(tbody.text()==="")){
  	tbody.text("");
  }
 // Select the date the user input
  console.log(userSelected);
  var userInput = d3.select("#datetime");
  console.log(userInput);
  // Get the value property of the input element
  var inputValue = userInput.property("value");
  console.log(inputValue);

    

  filteredData = filterData(userSelected, inputValue);

  console.log(filteredData);

  filteredData.forEach((filtered) => {
  	var row = tbody.append("tr");
  	Object.entries(filtered).forEach(([key,value])=>{
  		var cell = tbody.append("td");
  		cell.text(value);
  	})
  })

})


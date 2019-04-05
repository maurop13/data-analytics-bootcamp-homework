// Create a map object
var myMap = L.map("map", {
  center: [5, -75],
  zoom: 5
});

L.tileLayer("https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}", {
  attribution: "Map data &copy; <a href=\"https://www.openstreetmap.org/\">OpenStreetMap</a> contributors, <a href=\"https://creativecommons.org/licenses/by-sa/2.0/\">CC-BY-SA</a>, Imagery © <a href=\"https://www.mapbox.com/\">Mapbox</a>",
  maxZoom: 18,
  id: "mapbox.streets-basic",
  accessToken: API_KEY
}).addTo(myMap);


d3.json("https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_week.geojson", function(data){
  createMap(data.features);
});


function createMap(earthquakeData) {
  
  function set_style(feature) {
    return {
      opacity: 1,
      fillOpacity: 1,
      fillColor: set_color(feature.properties.mag),
      color: "#000000",
      radius: set_radius(feature.properties.mag),
      stroke: true,
      weight: 0.5
    };
  }
  function set_color(magnitude){
    if(magnitude>5){
      color= "Red"
    } else if(magnitude>4){
      color= "Tomato"
    } else if (magnitude >3){
      color= "Gold"
    } else if(magnitude>2) {
      color= "PaleGreen"
    } else if(magnitude>1){
      color= "LimeGreen"
    } else {
      color= "Teal"
    }
    return color;
  }
  function set_radius(magnitude) {
      if(magnitude == 0){
        return 1
      }
      else {
        return magnitude*2;
      }
  }
    
    
    L.geoJSON(earthquakeData, {
      pointToLayer: function(feature,latlng){
        return L.circleMarker(latlng);
      },
      style:set_style,
      onEachFeature: function (feature,layer){
    layer.bindPopup("<h3>" + feature.properties.place +
      "</h3><hr><p>" + (feature.properties.type) + "</p>" + (feature.properties.mag))
  }
  }).addTo(myMap);

    var legend = L.control({
      position:"bottomright"
    });

    Legend.onAdd = function(){
      var div = L.DomUtil.create("div","info legend");
      var grades = [0,1,2,3,4,5];
      var colors =["Teal","LimeGreen","PaleGreen","Gold","Tomato","Red"];
      for (var i = 0; i < grades.length; i++) {
        div.innerHTML +=
            '<i style="background:' + getColor(grades[i] + 1) + '"></i> ' +
            grades[i] + (grades[i + 1] ? '&ndash;' + grades[i + 1] + '<br>' : '+');
      }
      return div;
    };
    legend.addTo(myMap);
  }


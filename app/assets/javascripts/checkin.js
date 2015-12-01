// $(function() {
// 	$('#check_in').on('click', function(){
// 		console.log("Good");
// 	});
// });

//Your Location ---------------------------
function theFunction() {
 console.log("I'm working!");
};

var map;

function initMap() {

 if(navigator.geolocation) {
  navigator.geolocation.getCurrentPosition(function(position){
    var lat = position.coords.latitude;
    var lon = position.coords.longitude;
    console.log(lat);
    console.log(lon);

 var pyrmont = {lat: lat, lng: lon};

 });
};
};

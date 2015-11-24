
//Your Location
var x = document.getElementById("demo");

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}

function showPosition(position) {
    x.innerHTML = "Latitude: " + position.coords.latitude +
    "<br>Longitude: " + position.coords.longitude;
    var a = [position.coords.latitude, position.coords.longitude];
}


//------------------------


//Leaf Bar Location
function venueaddress(){
var map = L.map('map').setView([gon.lat,gon.lng], 16);

L.tileLayer('//{s}.tile.osm.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
}).addTo(map);

L.marker([gon.lat,gon.lng]).addTo(map)
L.marker([gon.lat,gon.lng]).addTo(map)
};

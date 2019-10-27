// main Script
//------------------------------------------------

// Marker
const CURRENT_MAP_ICO = "<i class='im im-icon-Geek-2'></i>";
const LECTURE_MAP_ICO = "<i class='im im-icon-Street-View'></i>";

// Map
const elementMap = document.getElementById('map');

// Is MapScrollwheel abale Attributes
const mapScrollAttr = document.querySelector('#map').dataset.mapScroll;

// Scroll enabling button
const scrollElement = document.querySelector('#scrollEnabling');

// Geo Location Button 
const currentGeoLocation = document.querySelector('#geoLocation');

// Geo GPS 
const GPS = document.querySelector('#gps');

// Geo GPS_END 
const GPS_END = document.querySelector("#gps_end");

// Steet View Button
const STREETELEMENT = document.querySelector("#streetView");

// get start lecture 
const GET_LECTURE = document.querySelector("#start");


let LECTURE_LAT;
let LECTURE_LNG;

// Google Map Style
// https://mapstyle.withgoogle.com/
const MAP_STYLE = [{
  "featureType": "poi",
  "elementType": "labels.text.fill",
  "stylers": [{ "color": "#747474" }, { "lightness": "23" }]
},
{
  "featureType": "poi.attraction",
  "elementType": "geometry.fill",
  "stylers": [{ "color": "#f38eb0" }]
},
{
  "featureType": "poi.government",
  "elementType": "geometry.fill",
  "stylers": [{ "color": "#ced7db" }]
},
{
  "featureType": "poi.medical",
  "elementType": "geometry.fill",
  "stylers": [{ "color": "#ffa5a8" }]
},
{
  "featureType": "poi.park",
  "elementType": "geometry.fill",
  "stylers": [{ "color": "#c7e5c8" }]
},
{
  "featureType": "poi.place_of_worship",
  "elementType": "geometry.fill",
  "stylers": [{ "color": "#d6cbc7" }]
},
{
  "featureType": "poi.school",
  "elementType": "geometry.fill",
  "stylers": [{ "color": "#c4c9e8" }]
},
{
  "featureType": "poi.sports_complex",
  "elementType": "geometry.fill",
  "stylers": [{ "color": "#b1eaf1" }]
},
{
  "featureType": "road",
  "elementType": "geometry",
  "stylers": [{ "lightness": "100" }]
},
{
  "featureType": "road",
  "elementType": "labels",
  "stylers": [{ "visibility": "off" },
  { "lightness": "100" }]
},
{
  "featureType": "road.highway",
  "elementType": "geometry.fill",
  "stylers": [{ "color": "#ffd4a5" }]
},
{
  "featureType": "road.arterial",
  "elementType": "geometry.fill",
  "stylers": [{ "color": "#ffe9d2" }]
},
{
  "featureType": "road.local",
  "elementType": "all",
  "stylers": [{ "visibility": "simplified" }]
},
{
  "featureType": "road.local",
  "elementType": "geometry.fill",
  "stylers": [{ "weight": "3.00" }]
},
{
  "featureType": "road.local",
  "elementType": "geometry.stroke",
  "stylers": [{ "weight": "0.30" }]
},
{
  "featureType": "road.local",
  "elementType": "labels.text",
  "stylers": [{ "visibility": "on" }]
},
{
  "featureType": "road.local",
  "elementType": "labels.text.fill",
  "stylers": [{ "color": "#747474" }, { "lightness": "36" }]
},
{
  "featureType": "road.local",
  "elementType": "labels.text.stroke",
  "stylers": [{ "color": "#e9e5dc" }, { "lightness": "30" }]
},
{
  "featureType": "transit.line",
  "elementType": "geometry",
  "stylers": [{ "visibility": "on" }, { "lightness": "100" }]
},
{
  "featureType": "water",
  "elementType": "all",
  "stylers": [{ "color": "#d2e7f7" }]
}];

// default Google config
const tools = {
  position: {
    lat: parseFloat(37.3232287),
    lng: parseFloat(126.8384344),
  },
  MAP_STYLE,
  elementMap,
  mapScrollAttr,
  scrollElement,
  currentGeoLocation,
}

// object
let googleMap;

// Geo way select Button
let selector;

// Geo Location Current & Create select Button
async function setNavigation() {
  init();
  await googleMap.geolocate();
  await googleMap.addPinMarker(CURRENT_MAP_ICO, 1, googleMap.position.lat, googleMap.position.lng);
  await googleMap.addPinMarker(LECTURE_MAP_ICO, 2, LECTURE_LAT, LECTURE_LNG);

  const singleListingMapContainer = document.querySelector("#map-container");
  const checkSelect = singleListingMapContainer.querySelector(".js_route_mode_way");
  if (!checkSelect || typeof (checkSelect) == 'undefined' && checkSelect == null) {
    selector = document.createElement("select");
    selector.classList.add("js_route_mode_way")
    selector.innerHTML = `
            <option value="DRIVING">Driving</option>
            <option value="WALKING">Walking</option>
            <option value="BICYCLING">Bicycling</option>
            <option value="TRANSIT">Transit</option>
    `;
    singleListingMapContainer.appendChild(selector);
  }
  else {
    // Route find listener  
    await googleMap.routeFind(singleListingMapContainer, LECTURE_LAT, LECTURE_LNG);
  }
}

function init() {
  if (elementMap && typeof (elementMap) !== 'undefined') {
    googleMap = new GoogleMap(tools);
    googleMap.setStreetView(STREETELEMENT);
    google.maps.event.addDomListener(window, 'load', googleMap.map);
  }
}

function lisnerInit() {

  GPS.style.visibility= "hidden";
  GPS_END.style.visibility = "hidden";
  STREETELEMENT.style.visibility = "hidden";
  GET_LECTURE.style.visibility = "visible";
  if(selector) {
    selector.remove();
  }
  GPS.addEventListener("click", () => {
    GPS_END.style.visibility = "visible";
    GET_LECTURE.style.visibility = "hidden";
    setNavigation();
  });
  GET_LECTURE.addEventListener("click", () => {
    googleMap.geolocate();
    getBounds();
  });
  GPS_END.addEventListener("click", () => {
    lisnerInit();
    init();
  });

};

function getBounds() {
  // 줌 또는 드래그, 화면이동 등 지도 정보 변경시에 화면내에 마커만 표시하기위해 좌표 인식
  google.maps.event.addListener(googleMap.map, 'zoom_changed', () => {
    boundsCheck();
  });

  google.maps.event.addListener(googleMap.map, 'dragend', () => {
    boundsCheck();
  });
}

function boundsCheck() {
  // bounds lat, lng 
  const startLat = googleMap.map.getBounds().getSouthWest().lat();
  const startLng = googleMap.map.getBounds().getSouthWest().lng();
  const endLat = googleMap.map.getBounds().getNorthEast().lat();
  const endLng = googleMap.map.getBounds().getNorthEast().lng();
  getLecture(startLat, startLng, endLat, endLng);
}

lisnerInit();
init();
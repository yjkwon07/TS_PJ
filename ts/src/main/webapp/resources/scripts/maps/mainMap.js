// Default infoBox Rating Type
var INFOBOX_RATINGTYPE = 'star-rating';
var IMAGE_URL = 'http://localhost:8090/jj/resources/images';
// Google Map Style
// https://mapstyle.withgoogle.com/
var MAINMAP_STYLE = [{
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

// Custom User Interface Elements
// Custom Zoom-In and Zoom-Out Buttons
// ----------------------------------------------- //
function ZoomControl(zoomControlDiv, map) {
  zoomControlDiv.index = 1;
  map.controls[google.maps.ControlPosition.RIGHT_CENTER].push(zoomControlDiv);

  // Creating divs & styles for custom zoom control
  zoomControlDiv.style.padding = '5px';
  zoomControlDiv.className = "zoomControlWrapper";

  // Set CSS for the control wrapper
  var controlWrapper = document.createElement('div');
  zoomControlDiv.appendChild(controlWrapper);

  // Set CSS for the zoomIn
  var zoomInButton = document.createElement('div');
  zoomInButton.className = "custom-zoom-in";
  controlWrapper.appendChild(zoomInButton);

  // Set CSS for the zoomOut
  var zoomOutButton = document.createElement('div');
  zoomOutButton.className = "custom-zoom-out";
  controlWrapper.appendChild(zoomOutButton);

  // Setup the click event listener - zoomIn
  google.maps.event.addDomListener(zoomInButton, 'click', function () {
    map.setZoom(map.getZoom() + 1);
  });

  // Setup the click event listener - zoomOut
  google.maps.event.addDomListener(zoomOutButton, 'click', function () {
    map.setZoom(map.getZoom() - 1);
  });
}

// Infobox Output
function locationData(customMap) {
  return (''+
    `
  <a href=${customMap.lectureURL} class="listing-img-container">
    <div class="infoBox-close"><i class="fa fa-times"></i></div>
    <img src="${customMap.lectureImg}" alt="${customMap.teacher_name}">
    <div class="listing-item-content">
      <h3>${customMap.lectureTitle}</h3>
      <span>${customMap.teacher_name}</span>
    </div>
  </a>

  <div class="listing-content">
    <div class="listing-title">
      <div class="${INFOBOX_RATINGTYPE}" data-rating="${customMap.lectureRating}">
        <div class="rating-counter">(${customMap.lectureReviewCounter} reviews)</div>
      </div>
    </div>
  </div>
  `);
}

// Geo Location Button
function geolocate(map) {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function (current) {
      var position = new google.maps.LatLng(current.coords.latitude, current.coords.longitude);
      map.setCenter(position);
      map.setZoom(15);
    });
  }
}

 // Map Attributes
var mapScrollAttr = document.querySelector('#map').dataset.mapScroll;

// Scroll enabling button
var scrollEnabling = document.querySelector('#scrollEnabling');

// Geo Location Button 
var currentGeoLocation = document.querySelector('#geoLocation');
var customcurrentGeoLocation = document.querySelector('.input-with-icon.location a i')

function mainMap(locations, position, mapZoom) {
  // Map setting 
  // Map Attributes
  // ----------------------------------------------- //

  var zoomLevel, scrollEnabled;
  if (mapZoom && typeof mapZoom !== "undefined") {
    zoomLevel = parseInt(mapZoom);
  } else {
    zoomLevel = 5;
  }

  if (mapScrollAttr && typeof mapScrollAttr !== "undefined") {
    scrollEnabled = parseInt(mapScrollAttr);
  } else {
    scrollEnabled = false;
  }

  // Main Map
  // ----------------------------------------------- //
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: zoomLevel,
    scrollwheel: scrollEnabled,
    // korea default
    center: new google.maps.LatLng(position.lat, position.lng),
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    zoomControl: false,
    mapTypeControl: false,
    scaleControl: false,
    panControl: false,
    navigationControl: false,
    streetViewControl: false,
    gestureHandling: 'cooperative',
    styles: MAINMAP_STYLE
  });

  var zoomControlDiv = document.createElement('div');
  var zoomControl = new ZoomControl(zoomControlDiv, map);

  // Scroll enabling button addEventListener
  // ----------------------------------------------- //
  if (scrollEnabling) {
    scrollEnabling.addEventListener('click', function (event) {
      event.preventDefault();
      if (this.matches(".enabled")) {
        map.setOptions({ 'scrollwheel': false });
        this.classList.remove("enabled");
      } else {
        map.setOptions({ 'scrollwheel': true });
        this.classList.add("enabled");
      }
    },
      {
        capture: false,
        passive: false
      }
    );
  }
  // Geo Location Button addEventListener
  // ----------------------------------------------- //
  if (currentGeoLocation) {
    currentGeoLocation.addEventListener('click', function (event) {
      event.preventDefault();
      geolocate(map);
    },
      {
        capture: false,
        passive: false
      }
    );
  }
  // Geo Location Button <a> tag   
  if (customcurrentGeoLocation) {
    customcurrentGeoLocation.addEventListener('click', function (event) {
      event.preventDefault();
      geolocate(map);
    }, {
      capture: false,
      passive: false
    }
    );
  }

  // Infobox(pin)
  // http://htmlpreview.github.io/?https://github.com/googlemaps/v3-utility-library/blob/master/infobox/docs/reference.html
  // ----------------------------------------------- //
  var infobox = new InfoBox();

  // Chosen Rating Type
  google.maps.event.addListener(infobox, 'domready', function () {
    starRating(`.infoBox .${INFOBOX_RATINGTYPE}`);
  });

  var pinMarkers = [];
  var boxText = document.createElement("div");
  boxText.className = 'map-box';
  var boxOptions = {
    content: boxText,
    disableAutoPan: false,
    alignBottom: true,
    maxWidth: 0,
    pixelOffset: new google.maps.Size(-134, -55),
    zIndex: null,
    boxStyle: {
      width: "270px"
    },
    closeBoxMargin: "0",
    closeBoxURL: "",
    infoBoxClearance: new google.maps.Size(300, 100),
    isHidden: false,
    pane: "floatPane",
    enableEventPropagation: false,
  };
  for (var locations_number = 1; locations_number < locations.length; locations_number++) {
    // pin custom config adapt
    var markerIcon = locations[locations_number]['pinImg'];
    var overlaypositions = new google.maps.LatLng(locations[locations_number]['lat'], locations[locations_number]['lng']);
    var overlayPinMarker = new CustomMarker(
      overlaypositions,
      map,
      {
        marker_id: locations[locations_number]['pinMarkerId'],
      },
      markerIcon
    );
    pinMarkers.push(overlayPinMarker);
    // infobox custom config adat
    google.maps.event.addDomListener(overlayPinMarker, 'click', (function (overlayPinMarker, locations_number) {
      return function () {
        boxText.innerHTML = locations[locations_number]['html'];
        infobox.setOptions(boxOptions);
        infobox.close();
        infobox.open(map, overlayPinMarker);

        google.maps.event.addListener(infobox, 'domready', function () {
          document.querySelector('.infoBox-close').addEventListener('click', function (event) {
            event.preventDefault();
            infobox.close();
            document.querySelectorAll('.map-marker-container').forEach(function(tag){
              tag.classList.remove('clicked', 'infoBox-opened');
            });
          });
        },
          {
            capture: false,
            passive: false
          }
        );
      }
    })(overlayPinMarker, locations_number));
  }

  // Marker highlighting when hovering listing item
  document.querySelectorAll('.listing-item-container').forEach(function (tag) {
    tag.addEventListener('mouseover', function () {
      var markerId = tag.dataset.markerId;
      if (markerId && typeof markerId !== "undefined") {
        var markerId = parseInt(markerId) - 1;
        var marker_div = pinMarkers[markerId].div;
        marker_div.classList.add('clicked');

        tag.addEventListener('mouseout', function () {
          if (marker_div.matches(":not(.infoBox-opened)")) {
            marker_div.classList.remove('clicked');
          }
        });
      }
    });
  });

  // Marker Clusterer Init
  // ----------------------------------------------- //
  var clusterStyles = [
    {
      textColor: 'white',
      url: '',
      height: 50,
      width: 50
    }
  ];

  var options = {
    imagePath: 'images/',
    styles: clusterStyles,
    minClusterSize: 2
  };
  var markerCluster = new MarkerClusterer(map, pinMarkers, options);

  google.maps.event.addDomListener(window, "resize", function () {
    var center = map.getCenter();
    google.maps.event.trigger(map, "resize");
    map.setCenter(center);
    Promise.resolve().then(someMethodIThinkMightBeSlow);
  });
}
// ---------------- Main Map / End ---------------- //

var startTime;
function initMap(){
  startTime = performance.now();
  var mapZoom = 8;
  var position ={
    lat: 37.3232287,
    lng: 126.8384344,
  };
  var locations = [
    {},
    {
      html: locationData('listings-single-page.html', `${IMAGE_URL}/classImages/listing-item-01.png`, "Tom's Restaurant", '964 School Street, New York', '3.5', '12'),
      lat: 40.94401669296697,
      lng: -74.16938781738281,
      pinMarkerId: 1,
      pinImg: '<i class="im im-icon-Chef-Hat"></i>'
    },
  ];

  var map = document.getElementById('map');
  if (map && typeof (map) !== 'undefined') {
    google.maps.event.addDomListener(window, 'load', mainMap(locations,position,mapZoom));
  }
}

function searchMap(customMap) {
  startTime = performance.now();
  var mapZoom = customMap.mapZoom;
  var position = {
    lat: customMap.lat,
    lng: customMap.lng,
  }
  var locations = [
    {},
    {
      html: locationData(customMap),
      lat: customMap.lat,
      lng: customMap.lng,
      pinMarkerId: 0,
      pinImg: `<i class="im ${customMap.pinImg}"></i>`
    },
  ];
  google.maps.event.addDomListener(window, 'load', mainMap(locations, position, mapZoom));
}

Promise.resolve(initMap()).then(someMethodIThinkMightBeSlow(startTime));


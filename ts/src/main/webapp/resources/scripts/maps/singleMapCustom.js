// Single Listing Map
// ----------------------------------------------- //
const singleMap = document.querySelector("#singleListingMap");
const SINGLE_STYLE = [{ "featureType": "poi", "elementType": "labels.text.fill", "stylers": [{ "color": "#747474" }, { "lightness": "23" }] }, { "featureType": "poi.attraction", "elementType": "geometry.fill", "stylers": [{ "color": "#f38eb0" }] }, { "featureType": "poi.government", "elementType": "geometry.fill", "stylers": [{ "color": "#ced7db" }] }, { "featureType": "poi.medical", "elementType": "geometry.fill", "stylers": [{ "color": "#ffa5a8" }] }, { "featureType": "poi.park", "elementType": "geometry.fill", "stylers": [{ "color": "#c7e5c8" }] }, { "featureType": "poi.place_of_worship", "elementType": "geometry.fill", "stylers": [{ "color": "#d6cbc7" }] }, { "featureType": "poi.school", "elementType": "geometry.fill", "stylers": [{ "color": "#c4c9e8" }] }, { "featureType": "poi.sports_complex", "elementType": "geometry.fill", "stylers": [{ "color": "#b1eaf1" }] }, { "featureType": "road", "elementType": "geometry", "stylers": [{ "lightness": "100" }] }, { "featureType": "road", "elementType": "labels", "stylers": [{ "visibility": "off" }, { "lightness": "100" }] }, { "featureType": "road.highway", "elementType": "geometry.fill", "stylers": [{ "color": "#ffd4a5" }] }, { "featureType": "road.arterial", "elementType": "geometry.fill", "stylers": [{ "color": "#ffe9d2" }] }, { "featureType": "road.local", "elementType": "all", "stylers": [{ "visibility": "simplified" }] }, { "featureType": "road.local", "elementType": "geometry.fill", "stylers": [{ "weight": "3.00" }] }, { "featureType": "road.local", "elementType": "geometry.stroke", "stylers": [{ "weight": "0.30" }] }, { "featureType": "road.local", "elementType": "labels.text", "stylers": [{ "visibility": "on" }] }, { "featureType": "road.local", "elementType": "labels.text.fill", "stylers": [{ "color": "#747474" }, { "lightness": "36" }] }, { "featureType": "road.local", "elementType": "labels.text.stroke", "stylers": [{ "color": "#e9e5dc" }, { "lightness": "30" }] }, { "featureType": "transit.line", "elementType": "geometry", "stylers": [{ "visibility": "on" }, { "lightness": "100" }] }, { "featureType": "water", "elementType": "all", "stylers": [{ "color": "#d2e7f7" }] }];

// Marker
const CURRENT_MAP_ICO = "<i class='im im-icon-Geek-2'></i>";
const LECTURE_MAP_ICO = "<i class='im im-icon-Street-View'></i>";

// GPS
const LECTURE_LAT = parseFloat(singleMap.dataset.latitude);
const LECTURE_LNG = parseFloat(singleMap.dataset.longitude);
let CURRENT_LAT = undefined;
let CURRENT_LNG = undefined;

function ZoomControl(controlDiv, single_map) {
    controlDiv.index = 1;
    single_map.controls[google.maps.ControlPosition.RIGHT_CENTER].push(controlDiv);

    controlDiv.style.padding = '5px';

    var controlWrapper = document.createElement('div');
    controlDiv.appendChild(controlWrapper);

    var zoomInButton = document.createElement('div');
    zoomInButton.className = "custom-zoom-in";
    controlWrapper.appendChild(zoomInButton);

    var zoomOutButton = document.createElement('div');
    zoomOutButton.className = "custom-zoom-out";
    controlWrapper.appendChild(zoomOutButton);

    google.maps.event.addDomListener(zoomInButton, 'click', function () {
        single_map.setZoom(single_map.getZoom() + 1);
    });

    google.maps.event.addDomListener(zoomOutButton, 'click', function () {
        single_map.setZoom(single_map.getZoom() - 1);
    });
}

// Geo Location Current & Create select Button
function geolocate(map) {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (current) {
            CURRENT_LAT = parseFloat(current.coords.latitude);
            CURRENT_LNG = parseFloat(current.coords.longitude);
            position = new google.maps.LatLng(CURRENT_LAT, CURRENT_LNG);
            new CustomMarker(
                position,
                map,
                {
                    marker_id: '2'
                },
                CURRENT_MAP_ICO
            );
            map.setCenter(position);
            map.setZoom(11);
        });

        const singleListingMapContainer = document.querySelector("#singleListingMap-container");
        const selector = document.createElement("select");
        selector.classList.add("js_route_mode_way")
        selector.innerHTML= `
            <option value="DRIVING">Driving</option>
            <option value="WALKING">Walking</option>
            <option value="BICYCLING">Bicycling</option>
            <option value="TRANSIT">Transit</option>
        `;
        singleListingMapContainer.appendChild(selector);
        routeFind(map);
    }
}

// Route find listener  
function routeFind(map) {
    const directionsRenderer = new google.maps.DirectionsRenderer;
    const directionsService = new google.maps.DirectionsService;
    
    directionsRenderer.setMap(map);
    calculateAndDisplayRoute(directionsService, directionsRenderer);
    document.querySelector('.js_route_mode_way').addEventListener('change', function() {
      calculateAndDisplayRoute(directionsService, directionsRenderer);
    });
}

// mode Route change
function calculateAndDisplayRoute(directionsService, directionsRenderer) {
    var selectedMode = document.querySelector('.js_route_mode_way').value;
    directionsService.route({
        origin: { lat: parseFloat(CURRENT_LAT), lng: parseFloat(CURRENT_LNG) }, 
        destination: { lat: parseFloat(LECTURE_LAT), lng: parseFloat(LECTURE_LNG) },  
        
        // Note that Javascript allows us to access the constant
        // using square brackets and a string value as its
        // "property."
        travelMode: google.maps.TravelMode[selectedMode]
    }, function (response, status) {
        if (status == 'OK') {
            directionsRenderer.setDirections(response);
        } else {
            console.error('Directions request failed due to ' + status);
            window.alert(`해당하는 ${selectedMode}방법은 현재 지원하지 않습니다`);
        }
    });
}

function singleListingMap() {
    const lectureLatlng = new google.maps.LatLng({lat: LECTURE_LAT, lng: LECTURE_LNG});
    let single_map = new google.maps.Map(document.getElementById('singleListingMap'), {
        zoom: 15,
        center: lectureLatlng,
        scrollwheel: false,
        zoomControl: false,
        mapTypeControl: false,
        scaleControl: false,
        panControl: false,
        navigationControl: false,
        streetViewControl: false,
        styles: SINGLE_STYLE,
    });

    // Steet View Button
    const streetView = document.querySelector("#streetView");
    streetView.addEventListener("click", function (event) {
        event.preventDefault();
        new google.maps.StreetViewPanorama(
            document.getElementById('singleListingMap'), {
              position: {lat: LECTURE_LAT, lng: LECTURE_LNG},
              addressControlOptions: {
                position: google.maps.ControlPosition.LEFT_CENTER
              },
              linksControl: true,
              panControl: true,
              enableCloseButton: true,
        });
    }, { passive: false });

    // we find out from Current Location to lecture Location
    const currentGeoLocation = document.querySelector('#geoLocation');
    if (currentGeoLocation) {
        currentGeoLocation.addEventListener('click', function (event) {
            event.preventDefault();
            geolocate(single_map);
        },
            {
                capture: false,
                passive: false
            }
        );
    }

    // Custom zoom buttons
    const zoomControlDiv = document.createElement('div');
    new ZoomControl(zoomControlDiv, single_map);
    new CustomMarker(
        lectureLatlng,
        single_map,
        {
            marker_id: '1'
        },
        LECTURE_MAP_ICO
    );
}

// Single Listing Map Init
const single_map = document.getElementById('singleListingMap');
if (typeof (single_map) != 'undefined' && single_map != null) {
    google.maps.event.addDomListener(window, 'load', singleListingMap);
}
// -------------- Single Listing Map / End -------------- //
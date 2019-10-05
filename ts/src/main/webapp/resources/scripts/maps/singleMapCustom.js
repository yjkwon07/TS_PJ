// Single Listing Map
// ----------------------------------------------- //
var streetView = document.querySelector("#streetView");
var singleMap = document.querySelector("#singleListingMap");
var SINGLE_STYLE = [{ "featureType": "poi", "elementType": "labels.text.fill", "stylers": [{ "color": "#747474" }, { "lightness": "23" }] }, { "featureType": "poi.attraction", "elementType": "geometry.fill", "stylers": [{ "color": "#f38eb0" }] }, { "featureType": "poi.government", "elementType": "geometry.fill", "stylers": [{ "color": "#ced7db" }] }, { "featureType": "poi.medical", "elementType": "geometry.fill", "stylers": [{ "color": "#ffa5a8" }] }, { "featureType": "poi.park", "elementType": "geometry.fill", "stylers": [{ "color": "#c7e5c8" }] }, { "featureType": "poi.place_of_worship", "elementType": "geometry.fill", "stylers": [{ "color": "#d6cbc7" }] }, { "featureType": "poi.school", "elementType": "geometry.fill", "stylers": [{ "color": "#c4c9e8" }] }, { "featureType": "poi.sports_complex", "elementType": "geometry.fill", "stylers": [{ "color": "#b1eaf1" }] }, { "featureType": "road", "elementType": "geometry", "stylers": [{ "lightness": "100" }] }, { "featureType": "road", "elementType": "labels", "stylers": [{ "visibility": "off" }, { "lightness": "100" }] }, { "featureType": "road.highway", "elementType": "geometry.fill", "stylers": [{ "color": "#ffd4a5" }] }, { "featureType": "road.arterial", "elementType": "geometry.fill", "stylers": [{ "color": "#ffe9d2" }] }, { "featureType": "road.local", "elementType": "all", "stylers": [{ "visibility": "simplified" }] }, { "featureType": "road.local", "elementType": "geometry.fill", "stylers": [{ "weight": "3.00" }] }, { "featureType": "road.local", "elementType": "geometry.stroke", "stylers": [{ "weight": "0.30" }] }, { "featureType": "road.local", "elementType": "labels.text", "stylers": [{ "visibility": "on" }] }, { "featureType": "road.local", "elementType": "labels.text.fill", "stylers": [{ "color": "#747474" }, { "lightness": "36" }] }, { "featureType": "road.local", "elementType": "labels.text.stroke", "stylers": [{ "color": "#e9e5dc" }, { "lightness": "30" }] }, { "featureType": "transit.line", "elementType": "geometry", "stylers": [{ "visibility": "on" }, { "lightness": "100" }] }, { "featureType": "water", "elementType": "all", "stylers": [{ "color": "#d2e7f7" }] }];

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

function singleListingMap() {
    var myLatlng = new google.maps.LatLng({lng: parseFloat(singleMap.dataset.longitude) , lat: parseFloat(singleMap.dataset.latitude), });

    var single_map = new google.maps.Map(document.getElementById('singleListingMap'), {
        zoom: 15,
        center: myLatlng,
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
    streetView.addEventListener("click", function (event) {
        event.preventDefault();
        single_map.getStreetView().setOptions({ visible: true, position: myLatlng });
    }, { passive: false });

    // Custom zoom buttons
    var zoomControlDiv = document.createElement('div');
    var zoomControl = new ZoomControl(zoomControlDiv, single_map);
    
    // Marker
    var singleMapIco = "<i class='im im-icon-Street-View'></i>";

    new CustomMarker(
        myLatlng,
        single_map,
        {
            marker_id: '1'
          },
        singleMapIco
    );
}

// Single Listing Map Init
var single_map = document.getElementById('singleListingMap');
if (typeof (single_map) != 'undefined' && single_map != null) {
    google.maps.event.addDomListener(window, 'load', singleListingMap);
}
// -------------- Single Listing Map / End -------------- //
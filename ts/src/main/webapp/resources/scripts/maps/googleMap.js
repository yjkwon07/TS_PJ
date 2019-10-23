class GoogleMap {
    constructor({ position, elementMap, scrollwheel, scrollElement, currentGeoLocation, MAP_STYLE }) {
        /**
         * Default infoBox Rating Type
         * @private 
         * @type {string}
        */
        this.INFOBOX_RATINGTYPE = 'star-rating';

        /**
         * Default Map style
         * @private 
         * @type {string}
        */
        this.MAP_STYLE = MAP_STYLE;

        // element & tools setting
        /**
         * @param {object} elementMap // div Map position
         * @param {object} scrollElement // div scrollElement
         * @param {object} currentGeoLocation // div currentGeoLocation
         */
        this.elementMap = elementMap;
        this.scrollElement = scrollElement;
        this.currentGeoLocation = currentGeoLocation;

        // Map setting & Map Attributes
        /**
         * @param {object} position It set the center, So It has the contain: (lat, lng)
         * @param {number} zoom It controll zoom
         * @param {boolean} scrollwheel It controll prevent scrollwheel
         * @param {google.map.Map} map It makes the Map (google)
         * @param {Array.<InfoBox>} infobox It makese the pinMarker that infomation ex) lecture Tutor, Summary etc...  
         * @param {Array} pinMarkers It makes the GPS pinMarker
         * @param {MarkerClusterer} markerCluster it makes the cluster (pin)
         */
        this.position = position;
        this.zoom = 8;
        this.scrollwheel = scrollwheel
        this.mapConfig(this.position);
        this.infobox = new InfoBox();
        this.pinMarkers = [];
        this.markerCluster;
    }
}

// Init Map Setting
//------------------------------------------------

/**
 * setting Map config
 * 
 * @param {object} position the position contain:
 * lat(GPS): latitude 
 * lng(GPS): lontitude
 * @return {google.maps.Map} map
 */
GoogleMap.prototype.mapConfig = function (position) {
    this.map = new google.maps.Map(this.elementMap, {
        center: new google.maps.LatLng(position.lat, position.lng),
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        zoomControl: false,
        mapTypeControl: false,
        scaleControl: false,
        panControl: false,
        navigationControl: false,
        streetViewControl: false,
        gestureHandling: 'cooperative',
        styles: this.MAP_STYLE
    });

    this.setMapZoom(this.zoom);
    this.setScrollEnabled(this.scrollwheel);
    // Custom Zoom-In and Zoom-Out Buttons
    const zoomControlDiv = document.createElement('div');
    this.zoomControl(zoomControlDiv);

    // Scroll enabling button addEventListener
    // ----------------------------------------------- //
    if (this.scrollElement) {
        const context = this.scrollElement;
        context.addEventListener('click', (event) => {
            event.preventDefault();
            if (context.matches(".enabled")) {
                this.map.setOptions({ 'scrollwheel': false });
                context.classList.remove("enabled");
            } else {
                this.map.setOptions({ 'scrollwheel': true });
                context.classList.add("enabled");
            }
        }, { passive: false });
    }

    // Geo Location Button addEventListener
    // ----------------------------------------------- //
    if (this.currentGeoLocation) {
        this.currentGeoLocation.addEventListener('click', (event) => {
            event.preventDefault();
            this.geolocate();
        }, { passive: false });
    }
};

// InfoBox Setting
//------------------------------------------------

/**
 * setting InfoBox (InfoBox object using)
 * setting pinMarker(CustomMarker Object using)
 * http://htmlpreview.github.io/?https://github.com/googlemaps/v3-utility-library/blob/master/infobox/docs/reference.html
 * 
 * @param {Array} locationsData 
 */
GoogleMap.prototype.setInfoBox = function (locationData) {
    this.removePinMarker();
    let infobox = new InfoBox();
    // Chosen Rating Type
    google.maps.event.addListener(infobox, 'domready', () => {
        starRating(`.infoBox .${this.INFOBOX_RATINGTYPE}`);
    });
    const boxText = document.createElement("div");
    boxText.className = 'map-box';
    let boxOptions = {
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
    for (let locations_number = 1; locations_number < locationData.length; locations_number++) {
        // pin custom config adapt
        const markerIcon = locationData[locations_number]['pinImg'];
        const marker_id = locationData[locations_number]['pinMarkerId'];
        const lat = locationData[locations_number]['lat'];
        const lng = locationData[locations_number]['lng'];
        const overlayPinMarker = this.addPinMarker(markerIcon, marker_id, lat, lng);

        // infobox custom config adat
        google.maps.event.addDomListener(overlayPinMarker, 'click', ((overlayPinMarker, locations_number) => {
            return () => {
                infobox.close();
                boxText.innerHTML = locationData[locations_number]['html'];
                infobox.setOptions(boxOptions);
                infobox.open(this.map, overlayPinMarker);

                // infobox Listener click view or close
                google.maps.event.addListener(infobox, 'domready', () => {
                    document.querySelector('.infoBox-close').addEventListener('click', (event) => {
                        event.preventDefault();
                        infobox.close();
                        document.querySelectorAll('.map-marker-container').forEach((tag) => {
                            tag.classList.remove('clicked', 'infoBox-opened');
                        });
                    }, { passive: false });
                });
            }
        })(overlayPinMarker, locations_number), { passive: false });
    }
    this.infobox = infobox;
}

// Clusterer Setting
//------------------------------------------------

/**
 * setting Marker Clusterer
 * create markerCluster setting in the map
 * @param {Array} pinMarkers pinMarkers the pinMarkers contains:
 * InfoBox{object} custom
 * 
 */
GoogleMap.prototype.setClusterStyles = function () {
    const clusterStyles = [
        {
            textColor: 'white',
            url: '',
            height: 50,
            width: 50
        }
    ];
    const options = {
        imagePath: 'images/',
        styles: clusterStyles,
        minClusterSize: 5
    };
    this.markerCluster = new MarkerClusterer(this.map, this.pinMarkers, options);
}

// Controll
//------------------------------------------------------------------------------------------------

// Zoom Controll
//------------------------------------------------

/**
 * Custom User Interface Elements
 * Custom Zoom-In and Zoom-Out Buttons
 * 
 * @param {object} zoomControlDiv the zoomControlDiv contain:
 * HTMLElement div tag
 */
GoogleMap.prototype.zoomControl = function (zoomControlDiv) {
    zoomControlDiv.index = 1;
    this.map.controls[google.maps.ControlPosition.RIGHT_CENTER].push(zoomControlDiv);

    // Creating divs & styles for custom zoom control
    zoomControlDiv.style.padding = '5px';
    zoomControlDiv.className = "zoomControlWrapper";

    // Set CSS for the control wrapper
    const controlWrapper = document.createElement('div');
    zoomControlDiv.appendChild(controlWrapper);

    // Set CSS for the zoomIn
    const zoomInButton = document.createElement('div');
    zoomInButton.className = "custom-zoom-in";
    controlWrapper.appendChild(zoomInButton);

    // Set CSS for the zoomOut
    const zoomOutButton = document.createElement('div');
    zoomOutButton.className = "custom-zoom-out";
    controlWrapper.appendChild(zoomOutButton);

    // Setup the click event listener - zoomIn
    google.maps.event.addDomListener(zoomInButton, 'click', () => {
        this.map.setZoom(this.map.getZoom() + 1);
    });

    // Setup the click event listener - zoomOut
    google.maps.event.addDomListener(zoomOutButton, 'click', () => {
        this.map.setZoom(this.map.getZoom() - 1);
    });
}

/**
 * setMapZoom
 * default setzoom : 8
 * 
 * @param {number} mapZoom 
 */
GoogleMap.prototype.setMapZoom = function (zoom) {
    if (zoom && typeof zoom !== "undefined") {
        this.map.setZoom(zoom);
    } else {
        this.map.setZoom(8);
    }
}

// scroll
//------------------------------------------------

/**
 * setScrollEnabled
 * default scrollwheel : false
 * 
 * @param {boolean} scrollwheel 
 */
GoogleMap.prototype.setScrollEnabled = function (scrollwheel) {
    if (scrollwheel && typeof scrollwheel !== "undefined") {
        this.map.setOptions({ scrollwheel });
    } else {
        this.map.setOptions({ 'scrollwheel': false });
    }
}

// InfoBox 
//------------------------------------------------

/**
 * Infobox Div template 
 * 
 * @param {object} infobox It is Dictionar, the infobox contain:
 *  'lectureURL': redirect move from URL
 *  'lectureImg': lecture image (path)
 *  'teacher_name': tutor_name
 *  'lectureTitle': lecture_summary
 *  'lectureRating': tutor_review score average
 *  'lectureReviewCounter': tutor_review score
 * @return {string} HTMLTEXT
 */
GoogleMap.prototype.locationData = function (infobox) {
    return ('' +
        `
        <a href=${infobox.lectureURL} class="listing-img-container">
            <div class="infoBox-close"><i class="fa fa-times"></i></div>
            <img src="${infobox.lectureImg}" alt="${infobox.teacher_name}">
            <div class="listing-item-content">
            <h3>${infobox.lectureTitle}</h3>
            <span>${infobox.teacher_name}</span>
            </div>
        </a>

        <div class="listing-content">
            <div class="listing-title">
            <div class="${this.INFOBOX_RATINGTYPE}" data-rating="${infobox.lectureRating}">
                <div class="rating-counter">(${infobox.lectureReviewCounter} reviews)</div>
            </div>
            </div>
        </div>
    `);
}

/**
 * setting DivTagClick
 * Marker highlighting when hovering listing item
 * if click the pint that open the infobox, we except the div remove that classList (clicked);
 * @deprecated
 * @param {Array} listingItemDiv the listingItemDiv contain:
 * HTMLElement div tag -> the  separated  container board lecture div 
 * document.querySelectorAll('.listing-item-container')
 */
GoogleMap.prototype.setDivTagClick = function (listingItemDiv) {
    listingItemDiv.forEach((tag) => {
        tag.addEventListener('mouseover', () => {
            let markerId = tag.dataset.markerId;
            if (markerId && typeof markerId !== "undefined") {
                markerId = parseInt(markerId);
                let marker_div = this.pinMarkers[markerId].div;
                marker_div.classList.add('clicked');

                tag.addEventListener('mouseout', () => {
                    if (marker_div.matches(":not(.infoBox-opened)")) {
                        marker_div.classList.remove('clicked');
                    }
                });
            }
        });
    });
}

/**
 * addPinMarker
 * @param {string} markerIcon 
 * @param {number} marker_id
 * @param {float} lat
 * @param {float} lng
 * 
 * @return {CustomMarker} CustomMarker
 */
GoogleMap.prototype.addPinMarker = function (markerIcon, marker_id, lat, lng) {
    const overlaypositions = new google.maps.LatLng(lat, lng);
    const overlayPinMarker = new CustomMarker(
        this.map,
        overlaypositions,
        {
            marker_id
        },
        markerIcon
    );
    this.pinMarkers.push(overlayPinMarker);
    return overlayPinMarker;
}

/**
 * removePinMarker
 * All PinMarker remove 
 * All InfoBox remove 
 * @param {Array} pinMarkers 
 */
GoogleMap.prototype.removePinMarker = function () {
    this.infobox.close();
    if(this.pinMarkers.length >= 1){
        this.pinMarkers.forEach((tag) => {
            tag.remove();
        });
    }
    this.infobox = new InfoBox();
    this.pinMarkers = [];
}

// Current loate (GPS)
//------------------------------------------------

/**
 * Geo Location Button
 * setLatLng: current postion
 * setzoom : 15
 * 
 * @return {google.maps.LatLng} current position
 */
GoogleMap.prototype.geolocate = function () {
    let position;
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(async (current) => {
            position = new google.maps.LatLng(current.coords.latitude, current.coords.longitude);
            this.position.lat = position.lat();
            this.position.lng = position.lng();
            await this.map.setCenter(position);
            await this.map.setZoom(15);
        });
    }
}

/**
 * routeFind
 * search the selecto value and find origin -> destination
 * @param {object} modeWayElement the modeWayDiv (Element):
 * @param {float} destination_lat
 * @param {float} destination_lng
 */
GoogleMap.prototype.routeFind = function (modeWayElement, destination_lat, destination_lng) {
    const directionsRenderer = new google.maps.DirectionsRenderer;
    const directionsService = new google.maps.DirectionsService;
    directionsRenderer.setMap(this.map);
    const checkSelect = modeWayElement.querySelector(".js_route_mode_way");
    modeWayElement.addEventListener('change', () => {
        const selectedMode = checkSelect.value;
        directionsService.route({
            origin: { lat: parseFloat(this.position.lat), lng: parseFloat(this.position.lng) },
            destination: { lat: destination_lat, lng: destination_lng},
            // Note that Javascript allows us to access the constant
            // using square brackets and a string value as its
            // "property."
            travelMode: google.maps.TravelMode[selectedMode],
        }, function (response, status) {
            if (status == 'OK') {
                directionsRenderer.setDirections(response);
            } else {
                console.error('Directions request failed due to ' + status);
                alert(`해당하는 ${selectedMode}방법은 현재 지원하지 않습니다`);
            }
        });
    });
}

/**
 * setStreetView
 * set the addEventListener 
 * After click that can see street at the postion 
 * @param {object} streetElement the streetDiv (Element):
 * 
 */
GoogleMap.prototype.setStreetView = function (streetElement) {
    streetElement.addEventListener("click",  (event) =>{
        event.preventDefault();
        new google.maps.StreetViewPanorama(
            this.elementMap, {
            position: { lat : this.position.lat, lng : this.position.lng },
            addressControlOptions: {
                position: google.maps.ControlPosition.LEFT_CENTER
            },
            linksControl: true,
            panControl: true,
            enableCloseButton: true,
        });
    }, { passive: false });
}

/**
 * setPosition
 * view resize center 
 * set lat, lng center
 */
GoogleMap.prototype.setPosition = function () {
    google.maps.event.addDomListener(window, "resize", () => {
        const center = this.map.getCenter();
        this.position.lat = center.lat();
        this.position.lng = center.lng();
        google.maps.event.trigger(this.map, "resize");
        this.map.setCenter(center);
    });
}
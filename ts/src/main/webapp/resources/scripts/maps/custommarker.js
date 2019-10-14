// Custom Map Marker
// https://developers.google.com/maps/documentation/javascript/reference/overlay-view
// ----------------------------------------------- //
function CustomMarker(map, latlng, args, markerIco) {
    this.latlng = latlng;
    this.args = args;
    this.markerIco = markerIco;
    // Explicitly call setMap on this overlay.
    this.setMap(map);
}
CustomMarker.prototype = new google.maps.OverlayView();
CustomMarker.prototype.draw = function () {
    let marker = this.div;
    if (!marker) {
        marker = this.div = document.createElement('div');
        marker.className = 'map-marker-container';
        marker.innerHTML = 
            `<div class="marker-container">
                <div class="marker-card">
                    <div class="front face">${this.markerIco}</div>
                    <div class="back face">${this.markerIco}</div>
                    <div class="marker-arrow"></div>
                </div>
            </div>`;
        // Clicked marker highlight
        google.maps.event.addDomListener(marker, "click", (_event) => {
            document.querySelectorAll('.map-marker-container').forEach(function (allMarker) {
                allMarker.classList.remove('clicked', 'infoBox-opened');
            });
            google.maps.event.trigger(this, "click");
            marker.classList.add('clicked', 'infoBox-opened');
        });

        if (typeof (this.args.marker_id) !== 'undefined') {
            marker.dataset.marker_id = this.args.marker_id;
        }
        const panes = this.getPanes();
        panes.overlayImage.appendChild(marker);
    }
    const point = this.getProjection().fromLatLngToDivPixel(this.latlng);
    if (point) {
        marker.style.left = (point.x) + 'px';
        marker.style.top = (point.y) + 'px';
    }
};
CustomMarker.prototype.remove = function () {
    if (this.div) {
        this.div.classList.remove('clicked');
        this.div.parentNode.removeChild(this.div);
        this.div = null; 
    }
};
CustomMarker.prototype.getPosition = function () { return this.latlng; };
// -------------- Custom Map Marker / End -------------- //
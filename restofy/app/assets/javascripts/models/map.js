$(document).ready(function(){	
  L.mapbox.accessToken = 'pk.eyJ1IjoidHNjaGFlZmZlcjc1MDQiLCJhIjoibGtEVEpDTSJ9.Ii90udJG3hfV3ftGYafKLQ';
	var geojson = gon.geojson;
	var map = L.mapbox.map('map', 'tschaeffer7504.mbaooln6').setView([38.899, -77.015], 12);
	map.scrollWheelZoom.disable();

	var listings = document.getElementById('listings');
	var locations = L.mapbox.featureLayer().addTo(map);

	locations.setGeoJSON(geojson);

	function setActive(el) {
		var siblings = listings.getElementsByTagName('div');
		for (var i = 0; i < siblings.length; i++) {
			siblings[i].className = siblings[i].className
			.replace(/active/, '').replace(/\s\s*$/, '');
		}
		el.className += ' active';
	}

	locations.eachLayer(function(locale) {

    var prop = locale.feature.properties;
    var last_inspection = locale.feature.last_inspection ? locale.feature.last_inspection : null

    // Each marker on the map.
    var popup = '<h3>' + prop.title + '</h3><div>' + prop.description + '<div><small class="quiet">' ;
    if (last_inspection) {
      popup+="<span class='popup-details'> Date of Last Inspection:  " + last_inspection.date + "</span>"
      popup+="<span class='popup-details'> # Critical Violations:  " + last_inspection.critical_violations + "</span>"
      popup+="<span class='popup-details'> Outstanding Critical Violations:  " + last_inspection.critical_violations_to_be_resolved + "</span></small>";
    }
    var listing = listings.appendChild(document.createElement('div'));
    listing.className = 'item';
    var link = listing.appendChild(document.createElement('a'));
    link.href = '#';
    link.className = 'title';
    link.innerHTML = prop.title;
    var details = listing.appendChild(document.createElement('div'));
    details.innerHTML = prop.description;
    if (last_inspection) {
      details.innerHTML += ' &middot; <br>Last Inspection Date: ' + last_inspection.date;
    }
    link.onclick = function() {
    	setActive(listing);
      // when item is clicked, pan map to center of associated point, and open popup. 
      map.setView(locale.getLatLng(), 16);
      locale.openPopup();
      return false;
  };
    // Marker interaction
    locale.on('click', function(e) {
      // 1. center the map on the selected marker.
      map.panTo(locale.getLatLng()), {
            paddingTopLeft: [0, 50]
          };
      // 2. Set active the markers associated listing.
      setActive(listing);
  });
    popup += '</div>';
    locale.bindPopup(popup);
  });
});
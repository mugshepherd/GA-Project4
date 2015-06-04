$(document).ready(function(){


	L.mapbox.accessToken = 'pk.eyJ1IjoidHNjaGFlZmZlcjc1MDQiLCJhIjoibGtEVEpDTSJ9.Ii90udJG3hfV3ftGYafKLQ';
	var southWest = L.latLng(38.852, -77.137),
			northEast = L.latLng(38.944, -76.976),
			bounds = L.latLngBounds(southWest, northEast);

	var map;
	map = L.mapbox.map('map', 'tschaeffer7504.mbaooln6', {
				maxBounds: bounds,
				maxZoom: 25,
				minZoom: 12
			}).setView([38.899, -77.015], 12);


	$.ajax({
	  dataType: 'text',
	  url: 'restaurants/index.json',
	  success: function(data) {
	    var geojson;
	    geojson = $.parseJSON(data);
	    return map.featureLayer.setGeoJSON(geojson);
	  }
	});


	map.featureLayer.on('layeradd', function(e) {
	  var marker, popupContent, properties;
	  marker = e.layer;
	  properties = marker.feature.properties;
	  popupContent = '<div class="popup">' + '<h3>' + properties.name + '</h3>' + '<p>' + properties.address + '</p>' + '</div>';
	  return marker.bindPopup(popupContent, {
	    closeButton: false,
	    minWidth: 320
	  });
	});

	$('article li').click(function(e) {
	  var current, currentlyClickedName;
	  current = $(this);
	  currentlyClickedName = current.find('h2').text();
	  return map.featureLayer.eachLayer(function(marker) {
	    var id;
	    if (marker.feature.properties.name === currentlyClickedName) {
	      id = layer._leaflet_id;
	      return map._layers[id].openPopup();
	    }
	  });
	});

});
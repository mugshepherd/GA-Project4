



$(document).ready(function() {
	$(".ul-content").bind("click", function( event ) {
		alert ("the mouse cursor is at (" + 
				event.pageX + ", " + event.pageY +
				")" );
	})
});




//   L.mapbox.accessToken = 'pk.eyJ1IjoidHNjaGFlZmZlcjc1MDQiLCJhIjoibGtEVEpDTSJ9.Ii90udJG3hfV3ftGYafKLQ';
//   var map = L.mapbox.map('map', 'tschaeffer7504.mbaooln6').setView([38.899, -77.015], 12);
//   var myLayer = L.mapbox.featureLayer().addTo(map);
 
	// $('.restaurant-ul').on('click', function(e) {
	// 	var current, currentlyClickedName;
	// 	current = $(this);



// 	  var current, currentlyClickedName;
// 	  current = $(this);
// 	  currentlyClickedName = current.find('.restaurant-name-li').text();
// 	  return map.featureLayer.eachLayer(function(marker) {
// 	    var id;
// 	    if (marker.feature.properties.title === currentlyClickedName) {
// 	      id = layeradd._leaflet_id;
// 	      return map._layers[id].openPopup();
// 	    }
// 	  });
// 	});

//   myLayer.on('layeradd', function(e) {
//     var marker, popupContent, properties;
//     marker = e.layer;
//     properties = marker.feature.properties;
//     popupContent = '<div class="popup"><h3><a href="/restaurants/' + properties.id + '" target="marker">' + properties.title + '</a></h3><p class="popup-num">Marker No. ' + properties.title + '</p><p>' + properties.description + '</p></div>';

//     return marker.bindPopup(popupContent, {
//       closeButton: false,
//       minWidth: 300
//     });
//   });

//   $.ajax({
//     dataType: 'text',
//     url: '/restaurants.json',
//     success: function(data) {
//       var geojson;
//       geojson = $.parseJSON(data);
//       return myLayer.setGeoJSON(geojson);
//     }
//   });
// });


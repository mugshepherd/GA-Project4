// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

<<<<<<< HEAD
var layer = L.mapbox.tileLayer('mapbox.streets');
layer.on('ready', function() {
  // the layer has been fully loaded now, and you can
  // call .getTileJSON and investigate its properties
});

$.ajax({
  dataType: 'text',
  url: '<%= root_path %>',
  success: function(data) {
    var geojson;
    geojson = $.parseJSON(data);
    return map.featureLayer.setGeoJSON(geojson);
  }
});

console.log("js working");
=======
>>>>>>> 20a1322cfe46b64075c6e8dbb7b79ba400d96988

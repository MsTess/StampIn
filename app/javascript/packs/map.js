import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
mapboxgl.accessToken = "pk.eyJ1IjoiYmJhbGRpZXJpIiwiYSI6ImNrcjF0NHRjYjFoMXcyb283dGlmOXphNmcifQ.0Zfphqy78nfdAvaMHQzpsg";


const buildMap = (mapElement) => {
  mapboxgl.accessToken = "pk.eyJ1IjoiYmJhbGRpZXJpIiwiYSI6ImNrcjF0NHRjYjFoMXcyb283dGlmOXphNmcifQ.0Zfphqy78nfdAvaMHQzpsg";
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  const geoCode = Object.values(markers);
 console.log(geoCode);
 // const popup = new mapboxgl.Popup().setHTML(geoCode[2]);
    new mapboxgl.Marker()
      .setLngLat([ geoCode[1], geoCode[0] ])
      // .setPopup(popup) // add this
      .addTo(map);
};

const fitMapToMarkers = (map, markers) => {
  const geoCode = Object.values(markers);
  console.log(geoCode)
  const bounds = new mapboxgl.LngLatBounds();
  bounds.extend([ geoCode[1], geoCode[0] ]);
  map.fitBounds(bounds, { padding: 50, maxZoom: 15 });
};

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const map = buildMap(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }
};

// var coordinates = points;

// var bounds = coordinates.reduce(function(bounds, coord) {
//   return bounds.extend(coord);
// }, new mapboxgl.LngLatBounds(coordinates[0], coordinates[0]));

// map.fitBounds(bounds, {
//   padding: { top: 50, bottom: 50, left: 50, right: 50 },
//   easing(t) {
//       return t * (2 - t);
//   }
// });

export { initMapbox };

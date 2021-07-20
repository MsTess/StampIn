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
 // console.log(markers);
    new mapboxgl.Marker()
      .setLngLat([ geoCode[1], geoCode[0] ])
      .addTo(map);
};

const fitMapToMarkers = (map, markers) => {
  const geoCode = Object.values(markers);
  const bounds = new mapboxgl.LngLatBounds();
  bounds.extend([ geoCode[1], geoCode[0] ]);
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
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

export { initMapbox };

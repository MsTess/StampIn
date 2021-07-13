import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = "pk.eyJ1IjoiYmJhbGRpZXJpIiwiYSI6ImNrcjF0NHRjYjFoMXcyb283dGlmOXphNmcifQ.0Zfphqy78nfdAvaMHQzpsg";
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });
  }
};

export { initMapbox };

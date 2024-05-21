import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

// Connects to data-controller="map"
export default class extends Controller {

  static values = {
    apiKey: String,
    markers: Array,

    // created new data attr to store activityId
    // activityId: Number
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element, // container ID
      style: 'mapbox://styles/mapbox/streets-v12' // style URL
      // center: [-74.5, 40], // starting position [lng, lat]
      // zoom: 9, // starting zoom
  });
  this.#addMarkersToMap()
  this.#fitMapToMarkers()
  }
  #addMarkersToMap() {
    // const activityCounters = {};  // Initialize the counter to store counters for each activity
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

    // Get the counter for the current activity
    // const activityId = marker.activity_id || this.activityIdValue;
    // let markerNumber = activityCounters[activityId] || 1;

      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html
      // customMarker.innerHTML = `${markerNumber}. ${marker.marker_html}`;



      // Pass the element as an argument to the new marker
      new mapboxgl.Marker(customMarker)
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(this.map);

      // Increment the counter for current activity
      // activityCounters[activityId] = markerNumber + 1;
    });
  }

  #fitMapToMarkers(){
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 10 })
  }
}

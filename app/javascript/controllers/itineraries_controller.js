import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const mapButton = document.querySelector('.c2a-button-map-itin');
    let elementsHidden = false;
    console.log(mapButton)
    mapButton.addEventListener('click', function() {
      if (elementsHidden) {
        // fade in all elements
        $('body').children().not('.c2a-button-map-itin, .no-show-itin, #navbar-itin, #map-act').fadeIn();
      } else {
        // fade out all elements except the specified ones
        $('body').children().not('.c2a-button-map-itin, .no-show-itin, #navbar-itin, #map-act').fadeOut();
      }
      elementsHidden = !elementsHidden;
    });
  }
}
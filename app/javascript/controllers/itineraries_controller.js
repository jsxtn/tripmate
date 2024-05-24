import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const mapButton = document.querySelector('.c2a-button-map-itin');
    let elementsHidden = false;
    console.log(mapButton)
    mapButton.addEventListener('click', function() {
      if (elementsHidden) {
        console.log('fading in all elements')
        // fade in all elements
        $('body').children().not('.c2a-button-map-itin, #navbar-itin, #map-act').fadeIn();
      } else {
        console.log('fading out all elements except specified ones')
        // fade out all elements except the specified ones
        $('body').children().not('.c2a-button-map-itin, #navbar-itin, #map-act').fadeOut();
      }
      elementsHidden = !elementsHidden;
    });
  }
}
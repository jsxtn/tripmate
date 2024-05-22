import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("hello there");
    document.addEventListener('DOMContentLoaded', function() {
      const mapButton = document.querySelector('.c2a-button-map');
      let elementsHidden = false;

      mapButton.addEventListener('click', function() {
        if (elementsHidden) {
          // Fade in all elements
          $('body').children().not('.c2a-button-map, #navbar-act, #map-act').fadeIn();
        } else {
          // Fade out all elements except the specified ones
          $('body').children().not('.c2a-button-map, #navbar-act, #map-act').fadeOut();
        }
        elementsHidden = !elementsHidden;
      });

      // Existing functionality for collapse/expand buttons
      const collapseAllButton = document.getElementById('collapseAllButton');
      const expandAllButton = document.getElementById('expandAllButton');

      collapseAllButton.addEventListener('click', function() {
        const collapseElements = document.querySelectorAll('.collapse.show');
        collapseElements.forEach(function(collapseEl) {
          new bootstrap.Collapse(collapseEl);
        });
      });

      expandAllButton.addEventListener('click', function() {
        const collapseElements = document.querySelectorAll('.collapse');
        collapseElements.forEach(function(collapseEl) {
          new bootstrap.Collapse(collapseEl, { toggle: false }).show();
        });
      });
    });
  }
}

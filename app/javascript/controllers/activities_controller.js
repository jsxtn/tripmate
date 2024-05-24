import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("activities index loaded")
    const mapButton = document.querySelector(".c2a-button-map")
    let elementsHidden = false

    mapButton.addEventListener("click", function () {
      if (elementsHidden) {
        // fade in all elements
        $("body")
          .children()
          .not(".c2a-button-map, #navbar-act, #map-act")
          .fadeIn()
      } else {
        // fade out all elements except the specified ones
        $("body")
          .children()
          .not(".c2a-button-map, #navbar-act, #map-act")
          .fadeOut()
      }
      elementsHidden = !elementsHidden
    })

    // collapse group and card script
    const collapseAllButton = document.getElementById("collapseAllButton")
    const expandAllButton = document.getElementById("expandAllButton")

    collapseAllButton.addEventListener("click", function () {
      const collapseElements = document.querySelectorAll(".collapse.show")
      collapseElements.forEach(function (collapseEl) {
        new bootstrap.Collapse(collapseEl)
      })
    })

    expandAllButton.addEventListener("click", function () {
      const collapseElements = document.querySelectorAll(".collapse")
      collapseElements.forEach(function (collapseEl) {
        new bootstrap.Collapse(collapseEl, { toggle: false }).show()
      })
    })
  }
}

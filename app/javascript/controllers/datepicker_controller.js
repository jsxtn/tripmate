import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  static values = { strings: Array }
  connect() {
    console.log(this.stringsValue)
    flatpickr(this.element
       , {
  //     mode: "range",
       minDate: "today",
       dateFormat: "d-m-Y"
   }
  )
  }
}

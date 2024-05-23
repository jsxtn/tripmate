import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js";

export default class extends Controller {
  static targets = ['question', 'form', 'button', 'spinner']

  connect() {
    this.question = 0
    console.log('questions controlelr connected')
    console.log('this.questionTargets.length', this.questionTargets.length)
    this.buttonTarget.disabled = true

    this.#typeNextQuestion(this.question)
  }

  next(event) {
    if (this.question >= this.questionTargets.length) {
      this.buttonTarget.disabled = false
      this.buttonTarget.classList.remove('d-none')
      return
    } else {
      console.log('reveal next question', event)
      this.#typeNextQuestion(this.question)
    }

  }

  startSpinning() {
    this.spinnerTarget.classList.remove('d-none')
    this.formTarget.style.filter = 'blur(5px)'
  }

  #typeNextQuestion(n) {
    const strings = JSON.parse(this.questionTargets[n].dataset.strings)

    new Typed(this.questionTargets[n], {
      strings: strings,
      typeSpeed: 25
    })

    console.log("this.questionTargets[n]", this.questionTargets[n])


    const parent = this.questionTargets[n].parentElement
    console.log("parent", parent)
    console.log("parent.querySelector('input')", parent.querySelector("input, textarea"))
    const inputElementParent = parent.querySelector("input, textarea").parentElement
    console.log({parent, inputElementParent})

    inputElementParent.classList.remove("d-none")

    this.question += 1
  }
}

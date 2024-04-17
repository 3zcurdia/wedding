import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="companion-list"
export default class extends Controller {
  static targets = [ "input", "companion" ]
  static classes = [ "disabled" ]

  updateList(){
    let max = this.currentValue
    this.companionTargets.forEach((companion, index) => {
      if (index < max) {
        companion.classList.remove(this.disabledClass)
      } else {
        companion.classList.add(this.disabledClass)
      }
    })
  }

  get currentValue() {
    return parseInt(this.inputTarget.value)
  }
}

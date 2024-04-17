import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="numeric-input"
export default class extends Controller {
  static targets = ["input"]

  initialize() {
    let minValue = 0
    let maxValue = 0
  }

  connect() {
    this.minValue = this.inputTarget.getAttribute("min")
    this.maxValue = this.inputTarget.getAttribute("max")
  }

  increment() {
    if (this.currentValue >= this.maxValue) return

    this.inputTarget.value = this.currentValue + 1
  }

  decrement() {
    if (this.currentValue <= this.minValue) return

    this.inputTarget.value = this.currentValue - 1
  }

  get currentValue() {
    return parseInt(this.inputTarget.value)
  }
}

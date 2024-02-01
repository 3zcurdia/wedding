import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autoupload-form"
export default class extends Controller {
  static targets = ["input", "button"]

  connect() {
    this.initialButtonText = this.buttonTarget.textContent;
  }

  select() {
    this.inputTarget.click()
  }

  upload() {
    this.buttonTarget.disabled = true
    this.buttonTarget.textContent = 'Loading...'
    this.element.submit()
    setTimeout(() => {
      this.buttonTarget.textContent = this.initialButtonText;
      this.buttonTarget.disabled = false;
    }, 3000);
  }
}

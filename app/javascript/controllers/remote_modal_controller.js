import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="remote-modal"
export default class extends Controller {
  connect() {
    console.log("Remote modal connected");
    this.element.showModal();
  }
}

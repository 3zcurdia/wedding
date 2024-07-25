import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="image-modal"
export default class extends Controller {
  static targets = ["image", "modal"];

  openModal(event) {
    event.preventDefault();
    this.imageTarget.src = event.currentTarget.dataset.src;
    this.modalTarget.classList.remove("hidden");
  }

  closeModal() {
    this.modalTarget.classList.remove("hidden");
  }
}

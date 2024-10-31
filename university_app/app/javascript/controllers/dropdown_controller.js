import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button", "menu"];

  toggle() {
    const isExpanded = this.buttonTarget.getAttribute("aria-expanded") === "true";
    this.buttonTarget.setAttribute("aria-expanded", !isExpanded);
    this.menuTarget.classList.toggle("hidden");
  }
}

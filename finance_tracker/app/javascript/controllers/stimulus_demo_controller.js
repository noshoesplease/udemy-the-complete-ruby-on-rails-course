import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="stimulus-demo"
export default class extends Controller {
  static targets = ["name", "output"];
  connect() {}
  greet() {
    const element = this.nameTarget
    const name = element.value
    this.outputTarget.textContent = `Hello, ${name}!`
  }
}

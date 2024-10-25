// app/javascript/controllers/nav_controller.js

import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["mobileMenu", "mobileMenuButton", "userMenu", "userMenuButton"]

  connect() {
    // Only add event listeners if the elements are present
    if (this.hasMobileMenuButtonTarget) {
      this.toggleMobileMenu = this.toggleMobileMenu.bind(this);
      this.mobileMenuButtonTarget.addEventListener("click", this.toggleMobileMenu);
    }

    if (this.hasUserMenuButtonTarget) {
      this.toggleUserMenu = this.toggleUserMenu.bind(this);
      this.closeUserMenuOnOutsideClick = this.closeUserMenuOnOutsideClick.bind(this);

      this.userMenuButtonTarget.addEventListener("click", this.toggleUserMenu);
      document.addEventListener("click", this.closeUserMenuOnOutsideClick);
    }
  }

  disconnect() {
    if (this.hasMobileMenuButtonTarget) {
      this.mobileMenuButtonTarget.removeEventListener("click", this.toggleMobileMenu);
    }

    if (this.hasUserMenuButtonTarget) {
      this.userMenuButtonTarget.removeEventListener("click", this.toggleUserMenu);
      document.removeEventListener("click", this.closeUserMenuOnOutsideClick);
    }
  }

  toggleMobileMenu() {
    const isExpanded = this.mobileMenuButtonTarget.getAttribute("aria-expanded") === "true";
    this.mobileMenuButtonTarget.setAttribute("aria-expanded", !isExpanded);
    this.mobileMenuTarget.classList.toggle("hidden");
  }

  toggleUserMenu(event) {
    event.stopPropagation(); // Prevent the click from closing the menu immediately
    this.userMenuTarget.classList.toggle("hidden");
  }

  closeUserMenuOnOutsideClick(event) {
    if (!this.userMenuTarget.contains(event.target) && event.target !== this.userMenuButtonTarget) {
      this.userMenuTarget.classList.add("hidden");
    }
  }
}

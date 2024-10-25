import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["paymentForm", "submitButton", "errorMessage"]

  connect() {
    console.log(this.hasPaymentFormTarget);
    // Retrieve the publishable key from the meta tag
    const publishableKey = document.querySelector('meta[name="stripe-publishable-key"]').content;
    this.stripe = Stripe(publishableKey); // Initialize Stripe with the publishable key

    // Initialize Stripe Elements
    const elements = this.stripe.elements();
    this.cardElement = elements.create('card'); // Create a card element
    this.cardElement.mount("#card-element"); // Mount it to the div with id "card-element"

    console.log("Connected to credit card controller");
  }

  submit(event) {
    event.preventDefault();
    console.log("Submitting form doot");
    if (this.hasSubmitButtonTarget) {
      this.submitButtonTarget.disabled = true;
      console.log("Submitting form");

      // Create the token using the card element
      this.stripe.createToken(this.cardElement).then((result) => {
        if (result.error) {
          this.showError(result.error.message);
          this.submitButtonTarget.disabled = false;
        } else {
          this.tokenHandler(result.token);
        }
      });
    } else {
      console.error("Submit button target not found.");
    }
  }

  tokenHandler(token) {
    if (!this.hasPaymentFormTarget) {
      console.error("Payment form target not found.");
      return;
    }
  
    const form = this.paymentFormTarget;
    const hiddenInput = document.createElement("input");
    hiddenInput.setAttribute("type", "hidden");
    hiddenInput.setAttribute("name", "payment[token]");
    hiddenInput.setAttribute("value", token.id);
    form.appendChild(hiddenInput);
  
    console.log("Token created and added to form, submitting form now.");
    form.submit();
  }

  showError(message) {
    this.errorTarget.textContent = message;
    this.errorTarget.classList.remove("hidden");
  }

  clearError() {
    this.errorTarget.textContent = "";
    this.errorTarget.classList.add("hidden");
  }
}

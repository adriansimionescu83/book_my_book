import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "input"]

 // This method is called when the user presses a key in the input field
 submitOnEnter(event) {
  // Check if the Enter key was pressed without holding the Shift key
  if (event.key === "Enter" && !event.shiftKey) {
    event.preventDefault(); // Prevents the default behavior (e.g., adding a new line)
    this.formTarget.requestSubmit(); // Submits the form
  }
}
}

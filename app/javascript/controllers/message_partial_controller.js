import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect(){
    const customEvent = new CustomEvent("new-message-added");
    window.dispatchEvent(customEvent);
  }
  
}

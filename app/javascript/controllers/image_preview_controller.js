import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "preview"]

  connect(){
    console.log('image preview')
  }

  preview(){
    let input = this.inputTarget;
    let preview = this.previewTarget;
    let file = input.files[0];
    let reader = new FileReader();

    reader.onloadend = function () {
      preview.src = reader.result;
    };

    if (file) {
      reader.readAsDataURL(file);
      preview.classList.remove('opacity-40');
    } else {
      preview.src = 'bookwheel_logo.png';
      preview.classList.add('opacity-40');
    }
  }  
}

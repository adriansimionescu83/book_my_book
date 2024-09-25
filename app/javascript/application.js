// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";

import Rails from "@rails/ujs"
Rails.start()


import initializeTooltips from './components/app_tooltips';

document.addEventListener("turbo:load", () => {

  // Initialize tooltips
  initializeTooltips(document);
});

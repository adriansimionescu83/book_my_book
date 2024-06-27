// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";

import initializeTooltips from './components/app_tooltips';

document.addEventListener("turbo:load", () => {

  // Initialize tooltips
  initializeTooltips(document);
});

import tippy from 'tippy.js';
import 'tippy.js/animations/shift-away.css';

console.log('Hello')

class MenuTooltips {
  constructor(elements){
    this.elements = elements
  }

  initialize(){
    this.elements.forEach(element => this.#initializeTooltip(element))
  }

  #initializeTooltip(element){
    if (element._tippy) return;
    
    let props = {
      animation: 'fade',
      duration: 0,
      theme: 'menu',
      placement: 'right',
      allowHTML: true
    }

    new tippy(element, props);
  }
}

class ExplanationTooltips {
  constructor(elements){
    this.elements = elements
  }

  initialize(){
    this.elements.forEach(element => this.#initializeTooltip(element))
  }

  #initializeTooltip(element){
    if (element._tippy) return;

    let content = element.dataset.content;

    if (content.startsWith('template.')){
      const tplId = content.split('.')[1]
      content = document.querySelector(`#${tplId}`).innerHTML
    }

    let props = {
      animation: 'fade',
      duration: 0,
      content: content,
      theme: 'explanation',
      placement: 'bottom-start',
      maxWidth: 450,
      allowHTML: true
    }

    new tippy(element, props);
  }
}


class Dropdowns {
  constructor(elements){
    this.elements = elements
    console.log('Hey');

  }

  initialize(){
    this.elements.forEach(element => this.#initializeDropdown(element))
    console.log('H0');

  }

  #initializeDropdown(element){
    console.log('Let go');

    if (element._tippy) return;

    let content = element.dataset.content;

    if (content.startsWith('template.')){
      const tplId = content.split('.')[1]
      content = document.querySelector(`#${tplId}`).innerHTML
    }

    const theme = (element.dataset.theme) ? element.dataset.theme : 'explanation'

    let props = {
      trigger: 'click',
      animation: 'shift-away',
      duration: 100,
      content: content,
      theme: theme,
      interactive: true,
      placement: 'bottom-start',
      maxWidth: 800,
      allowHTML: true,
      onMount(element){

      }
    }

    props = { ...props, ...this.#triggers(element)}

    new tippy(element, props);
  }

  #triggers(element){
    let triggers = {}
    if (!element.dataset.triggers) return triggers

    const dataTriggers = JSON.parse(element.dataset.triggers)


    dataTriggers.forEach(trigger => {
      const [type, def] = trigger.split('.')
      let triggerFunction

      switch (def){
        // Add here the triggers definitions if needed
          // Example below
        // case 'initFilter':
        //   triggerFunction = (instance) => {
        //     const customEvent = new CustomEvent("initialize-filter-inputs");
        //     window.dispatchEvent(customEvent);
        //   }
        //   break;
       
        default:
          triggerFunction = function(instance){}
      }

      triggers[type] = triggerFunction
    })

   return triggers;    
  }
}


const initializeTooltips = (container) => {
  const menuSelectors = container.querySelectorAll('[data-tooltip="menu"]');
  if (menuSelectors) new MenuTooltips(menuSelectors).initialize();
  const explanationSelectors = container.querySelectorAll('[data-tooltip="explanation"]');
  if (explanationSelectors) new ExplanationTooltips(explanationSelectors).initialize();
  const dropdownSelectors = container.querySelectorAll('[data-tooltip="dropdown"]');
  if (dropdownSelectors) new Dropdowns(dropdownSelectors).initialize();
}


export default initializeTooltips;

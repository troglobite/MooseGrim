// import { onload } from "./utility";

export function toggleHidden(el) {
  if (el.hidden) {
    el.hidden = false;
  } else {
    el.hidden = true;
  }
}

export function onload() {
  return new Promise(function(resolve, reject) {
    if (document.readyState === 'complete') {
      return resolve();
    }
    window.addEventListener('load', resolve);
  })
}

const newTicketForm = document.querySelector('.new-ticket-form');
const newButton = document.querySelector('#new-ticket-button');

onload().then(toggleHidden(newTicketForm));

newButton.addEventListener('click', event => {
  event.preventDefault();
  toggleHidden(newTicketForm);
});

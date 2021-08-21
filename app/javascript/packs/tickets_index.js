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
const submitButton = document.querySelector('.new-ticket-submit');
const pr_url_field = document.querySelector('#pr_url_field');
const ticket_url_field = document.querySelector('#ticket_url_field');
const status_field = document.querySelector('#status_field');
const notes_field = document.querySelector('#notes_field');

onload().then(toggleHidden(newTicketForm));

newButton.addEventListener('click', event => {
  event.preventDefault();
  toggleHidden(newTicketForm);
});

submitButton.addEventListener('click', event => {
  event.preventDefault();
  submitForm(event);
});

export function submitForm(event) {
  const data = {
    pr_url: pr_url_field.value,
    ticket_url: ticket_url_field.value,
    status_field: status_field.value,
    notes_field: notes_field.value
  }
  fetch(event.target.dataset.ticketsUrl, {
    method: 'POST',
    headers: { 
      'Content-Type': 'application/json', 
      "Accept": "application/json",
      "X-CSRF-Token" : document.getElementsByName("csrf-token")[0].content
    },
    body: JSON.stringify(data)
  })
  .then(response => console.log(response))
}

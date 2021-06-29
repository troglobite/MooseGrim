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
const pr_url_field = document.querySelector('.pr_url_field');
const ticket_url_field = document.querySelector('.ticket_url_field');
const status_field = document.querySelector('.status_field');
const notes_field = document.querySelector('.notes_field');

onload().then(toggleHidden(newTicketForm));

newButton.addEventListener('click', event => {
  event.preventDefault();
  toggleHidden(newTicketForm);
});

submitButton.addEventListener('click', event => {
  event.preventDefault();
  submitForm();
});

export function submitForm() {
  const data = {
    pr_url: pr_url_field,
    ticket_url: ticket_url_field,
    status_field: status_field,
    notes_field: notes_field
  }
  fetch('/tickets', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(data)
  })
    .then(response => response.json())
    .then(data => console.log(data));
}

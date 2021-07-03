import * as utilities from "./utility"

const newTicketForm = document.querySelector('.new-ticket-form');
const newButton = document.querySelector('#new-ticket-button');
const submitButton = document.querySelector('.new-ticket-submit');
const pr_url_field = document.querySelector('#pr_url_field');
const ticket_url_field = document.querySelector('#ticket_url_field');
const status_field = document.querySelector('#status_field');
const notes_field = document.querySelector('#notes_field');

function submitForm(event) {
  const data = {
    pr_url: pr_url_field.value,
    ticket_url: ticket_url_field.value,
    status_field: status_field.value,
    notes_field: notes_field.value
  }

  const requestBody = {
    method: 'POST',
    headers: { 
      'Content-Type': 'application/json', 
      "Accept": "application/json",
      "X-CSRF-Token" : document.getElementsByName("csrf-token")[0].content
    },
    body: JSON.stringify(data)
  }
  fetch(event.target.dataset.ticketsUrl, requestBody)
    .then(response => handleSuccess(response))
    .catch(error => handleError(error))
}

function handleSuccess(response) {
  console.log(response)
}

function handleError(error) {
  console.error(error);
}

newButton.addEventListener('click', event => {
  event.preventDefault();
  utilities.toggleHidden(newTicketForm);
});

submitButton.addEventListener('click', event => {
  event.preventDefault();
  submitForm(event);
});

utilities.onload().then(function() {
  utilities.toggleHidden(newTicketForm)
});

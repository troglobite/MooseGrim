import * as utilities from "./utility"

const newTicketButton = document.querySelector('#new-ticket-button');
const newTicketUrl = document.querySelector('.url').dataset.ticketsUrl

function submitForm(event) {

  const requestBody = {
    method: 'GET',
    headers: { 
      'Content-Type': 'application/json', 
      "Accept": "application/json",
      "X-CSRF-Token" : document.getElementsByName("csrf-token")[0].content
    }
  }
  fetch(newTicketUrl, requestBody)
    .then(response => handleSuccess(response))
    .catch(error => handleError(error))
}

function handleSuccess(response) {
  debugger;
  console.log(response)
}

function handleError(error) {
  console.error(error);
}

// newButton.addEventListener('click', event => {
//   event.preventDefault();
//   utilities.toggleHidden(newTicketForm);
// });


// Enable when you want the new ticket button to work
// newTicketButton.addEventListener('click', event => {
//   event.preventDefault();
//   submitForm(event);
// });

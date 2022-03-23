Rails.application.routes.draw do
  get 'journal/index'
  root 'tickets#index'

  resources :tickets do
    resources :logs
  end

  # Serve websocket cable requests in-process
   mount ActionCable.server => '/cable'
end

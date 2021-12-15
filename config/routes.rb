Rails.application.routes.draw do
  root 'tickets#index'

  resources :tickets do
    resources :logs
  end

  # Serve websocket cable requests in-process
   mount ActionCable.server => '/cable'
end

Rails.application.routes.draw do
  resources :data_requests, only: [:create]
end

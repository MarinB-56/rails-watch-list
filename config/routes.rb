Rails.application.routes.draw do
  resources :lists, except: [:destroy]
end

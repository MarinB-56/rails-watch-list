Rails.application.routes.draw do
  resources :lists, only: [:new, :index, :edit, :destroy]
end

Rails.application.routes.draw do
  resources :lists, except: [:destroy] do
    resources :bookmarks, only: [:new, :create, :destroy]
  end
end

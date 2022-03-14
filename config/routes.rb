Rails.application.routes.draw do
  root "reports#index"

  resources :reports, except: [:destroy]
end

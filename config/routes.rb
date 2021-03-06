Rails.application.routes.draw do
  root 'questions#index'
  resources :questions do
    resources :answers, only: [:index, :new, :create]
  end
  resources :answers, only: :update
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/sign_out', to: 'sessions#destroy'
end

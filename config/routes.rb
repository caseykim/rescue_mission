Rails.application.routes.draw do
  root 'questions#index'
  resources :questions do
    resources :answers, only: [:index, :new, :create]
  end
  resources :answers, only: :update
end

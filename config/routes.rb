Rails.application.routes.draw do
  devise_for :users
  root "boards#index"
  get "search/index"
  get "attention/term"
  get "attention/assistance"
  resources :boards, only: [:index, :new, :create, :show, :update] do
    resources :messages, only: [:create]
  end
end

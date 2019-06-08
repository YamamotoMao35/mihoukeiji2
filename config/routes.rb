Rails.application.routes.draw do
  root "boards#index"
  resources :boards, only: [:index, :new, :create, :show, :update] do
    resources :messages, only: [:create]
  end
end

Rails.application.routes.draw do
  devise_for :users
  root "boards#index"
  get "search/index"
  get "attention/term"
  get "attention/assistance"
  get "attention/privacy_policy"
  resources :boards, only: [:index, :new, :create, :show, :update] do
    collection do
      get :category_search
    end
    resources :messages, only: [:create]
  end

  resources :users, only: [:show, :edit, :update, :destroy] do
    get :withdrawal, on: :member
    resources :profiles, only: [:index, :create, :update]
  end
end

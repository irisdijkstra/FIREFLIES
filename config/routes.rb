Rails.application.routes.draw do
  get 'fireflies/create'
  get 'fireflies/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get "content_form", to: "pages#content", as: :content
  # get "destination_form", to: "pages#destination", as: :destination

  resources :messages, only: %i[create edit new] do
    resources :fireflies, only: %i[create new]
  end

  resources :fireflies, only: %i[show destroy]
end

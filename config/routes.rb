Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get root "home#index"

  get "/about"=> "home#about"

  get "/contact"=> "contact#new"

  post "/contact"=>"contact#create"

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  resources :users, only: [:new, :create]
  resources :products do
  resources :reviews, only: [:create, :destroy]
  end

end

Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    member do
      get 'like', to: "posts#like"
      get 'unlike', to: "posts#unlike"
    end
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'posts#index'
end

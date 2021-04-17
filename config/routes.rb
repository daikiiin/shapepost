Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users', to: redirect("/users/sign_up")
    authenticated :user do
      root :to => 'posts#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  resources :posts, only: [:index, :new, :create, :edit, :update,:destroy]
end

Webmanager::Engine.routes.draw do
  devise_for :users, class_name: "Webmanager::User", :module => :devise
  devise_scope :user do
    get 'sign_in', to: '/devise/sessions#new'
    get 'sign_out', to: '/devise/sessions#destroy'
  end
  root to: 'home#index'
end

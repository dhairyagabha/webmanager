Webmanager::Engine.routes.draw do
  devise_for :users, class_name: "Webmanager::User", module: :devise
  devise_scope :user do
    get '/webmanager/sign_in', to: 'devise/sessions#new'
    delete '/webmanager/sign_out', to: 'devise/sessions#destroy'
  end
  root to: 'home#index'
end

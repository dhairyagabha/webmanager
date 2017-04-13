Webmanager::Engine.routes.draw do
  root to: 'home#index'
  devise_for :users, class_name: "Webmanager::User", :module => :devise
  devise_scope :user do
    get 'sign_in', to: '/devise/sessions#new'
    delete 'sign_out', to: '/devise/sessions#destroy'
  end
  resources :articles
  resources :blog_assets
  resources :forms
  resources :form_fields
  resources :form_responses
  resources :notes
  resources :tags
  resources :newsletter_receivers
  resources :events
end

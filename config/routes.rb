Rails.application.routes.draw do
  root to: 'tops#index'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',  
    sessions: 'users/sessions'
  }
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users
  resources :give_items
  resources :sent_items
  resources :give_persons
  resources :family_persons
  resources :genres
end

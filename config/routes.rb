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
  resources :give_returns do
    collection do
      get :index_show
    end
  end
  resources :sent_items
  resources :sent_persons
  resources :sent_returns
  resources :give_persons
  resources :family_persons
  resources :genres
end

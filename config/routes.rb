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
  resources :give_items do
    collection do
      get :search
    end
  end
  resources :give_returns do
    collection do
      get :index_show
    end
  end
  resources :sent_items do
    collection do
      get :search
    end
  end
  resources :sent_returns do
    collection do
      get :index_show
    end
  end
  resources :give_persons
  resources :sent_persons
  resources :family_persons
  resources :genres
end

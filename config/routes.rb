Rails.application.routes.draw do
  
  get 'sent_items/index'
  get 'give_items/index'
  get 'users/index'
  root to: 'tops#index'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',  
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  resource :schedules, only: [:show]
  resources :tasks
  
  root to: 'static_pages#home'
  
end

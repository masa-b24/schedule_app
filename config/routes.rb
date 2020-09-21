Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  #resources :users, only: [:show] do
    #resources :tasks, only: [:show, :new, :edit]
  #end

  resource :schedules, only: [:show]
  
  root to: 'static_pages#home'
  
end

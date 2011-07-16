Campus::Application.routes.draw do

  get "course/create"

  get "school/create"


  match '/users/auth/:provider/callback' => 'authentications#create'  

  match "landing_page/index", :to => 'landing_page#index'

  devise_for :users,:controllers=> {:registrations=> 'registrations' }
  devise_scope :user do
    match '/users/registered' => 'registrations#registered'
  end

  resources :books
  resources :posts

  namespace :setting do
    get "show"
    get "privacy"
    get "notification"
  end

  namespace :home do
    get "show"
    get "edit"
    get "profile"
    get "welcome"
  end
  
  resources :book_ownerships do
  end

  namespace :books do
    get 'search'
  end

  root :to=> "home#show"
end

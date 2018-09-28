Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/sign_in' => 'users#sign_in'
  post '/users/check_credentials' => 'users#check_credentials'
  get '/homepage' => 'users#homepage'
  get '/users/logout' => 'users#logout'
  get '/real_estate_companies/new' => 'real_estate_companies#new'
  get '/real_estate_companies' => 'real_estate_companies#index'
  post '/real_estate_companies/create' => 'real_estate_companies#create'
  root 'users#sign_in'
  get '/realtors/new' => 'realtors#new'
  post '/realtors/create' => 'realtors#create'
  get '/realtors/edit_company' => 'realtors#edit_company'
  post '/realtors/save_company' => 'realtors#save_company'
  get '/house_hunters/new' => 'house_hunters#new'
  post '/house_hunters/create' => 'house_hunters#create'
  get '/houses/new' => 'houses#new'
  post '/houses/create' => 'houses#create'
  get '/houses/index' => 'houses#index'
  get '/users/show_all' => 'users#show_all'
  get '/realtors' => 'realtors#index'
  get '/add_to_interest_list/:id' => 'houses#add_to_interest_list'
  get '/show_houses_with_filters/' => 'houses#show_houses_with_filters'
  get '/inquiries/new/:id' => 'inquiries#new'
  post '/inquiries/create' => 'inquiries#create'
  get '/inquiries/current_user_inquiries' => 'inquiries#current_user_inquiries'
  resources :inquiries
  resources :realtors
  resources :real_estate_companies
  resources :houses
end

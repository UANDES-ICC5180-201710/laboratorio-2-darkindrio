Rails.application.routes.draw do
  resources :people
  resources :courses
  get '/show_people' => 'courses#show_people'
  get '/show_people' => 'courses#add_people'
 
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

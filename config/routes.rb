Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
	root 'users#index'
	resources :courses
	resources :user_courses
	resources :users, except: :index

	get '/login' => 'sessions#new'
	post '/login' => 'sessions#create'
	get '/logout' => 'sessions#destroy'

	get '/signup' => 'users#new'
	post '/users' => 'users#create'
	post "/courses/:id/verify" => "courses#verify", as: "verify"
	post "/user_courses/attend" => "user_courses#attend", as: "attend"
	get '/search', to: "courses#search", as: "search"
end

FAuth::Application.routes.draw do
	resources :users
	resources :sessions, only: [:new, :create, :destroy]
	root "static_pages#home"

	get '/display', to: "static_pages#display"
	get '/about', to: 'static_pages#about'
	get '/signup', to: 'users#new'	
	get '/signin', to: 'sessions#new'
	delete '/signout', to: 'sessions#destroy'
	


end

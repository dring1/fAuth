FAuth::Application.routes.draw do
	resources :users
	root "static_pages#home"

	get '/display', to: "static_pages#display"
	get '/signup', to: 'users#new'	
	get '/about', to: 'static_pages#about'
	#get 'signin', to:'sessions#new'


end

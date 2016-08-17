Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	get 'emails', to: 'emails#index'
	post 'emails', to: 'emails#create'
end

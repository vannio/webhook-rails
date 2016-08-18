Rails.application.routes.draw do
  get '/', to: redirect('/emails')
	get 'emails', to: 'emails#index'
	post 'emails', to: 'emails#create'
end

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
    #registrations: "users/registrations"
  }


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "article#index"
  #get "/articles", to: "article#index"
  #get "/article/:id", to: "article#show"
  resources :article do
    resources :comments
  end

  get '/cleanup', to: "article#cleanup"
  get '/autoadd', to: "article#autoadd"
  get '/sendmail', to: "article#sendmail"
  get '/flash', to: 'article#flash'
  get '/cookie_info', to: 'cookieshow#info'
end

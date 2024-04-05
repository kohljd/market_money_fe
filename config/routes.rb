Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :markets, only: [:index, :show]
  resources :vendors, only: :show
end

#         Prefix Verb URI Pattern                                Controller#Action
#        markets GET  /markets(.:format)                         markets#index
#         market GET  /markets/:id(.:format)                     markets#show
#         vendor GET  /vendors/:id(.:format)                     vendors#show
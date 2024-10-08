Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  post 'v1/sign_in' => 'v1/login#create'
  post 'v1/alerts' => 'v1/alerts#create'
  get 'v1/alerts' => 'v1/alerts#index'
  delete 'v1/alerts/:id' => 'v1/alerts#destroy'
end

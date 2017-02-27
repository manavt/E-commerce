Rails.application.routes.draw do

namespace :api do
  resources :products
end
get "get_me/:name/myname", to: "users#index"
   get 'signin', to: "users#sign_in"
   get 'signup', to: "users#new"
   resources :users do
     collection do
       get "sign_in"
       post "allow_login"
       delete "logout"
     end
     member do
        get "my_name"
     end
   end
   root "products#index"
   resources :products do
     collection do
       get "download_in_csv"
       get "in_json"
     end
   end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

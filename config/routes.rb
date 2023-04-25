Rails.application.routes.draw do
  
  mount Avo::Engine, at: Avo.configuration.root_path
  # authenticate :user, lambda { |u| u.role == "admin" } do
  # mount Avo::Engine => "/admin", :as => "avo"
    devise_for :users,
               controllers: {
               registrations: "users/registrations",
                  confirmations: "users/confirmations",
                 sessions: "users/sessions"            
    }
        devise_scope :user do  
         get '/users/sign_out' => 'users/sessions#destroy'     
         post '/users/sign_up', to: 'users/registrations#create'
        end
         
  root "homes#index"
  resources :locations
  resources :purchase_requests
end


Rails.application.routes.draw do
  
  root "homes#index"
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

  resources :users do
    resources :purchase_requests
  end
  
  resources :locations
end


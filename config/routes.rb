Rails.application.routes.draw do
  
  mount Avo::Engine, at: Avo.configuration.root_path
  # authenticate :user, lambda { |u| u.role == "admin" } do
  # mount Avo::Engine => "/admin", :as => "avo"
  devise_for :users, controllers: { sessions: "users/sessions" }

  root "homes#index"

  resources :purchase_requests

end

Rails.application.routes.draw do
  mount Avo::Engine, at: Avo.configuration.root_path
  # authenticate :user, lambda { |u| u.role == "admin" } do
  # mount Avo::Engine => "/admin", :as => "avo"
  devise_for :users, controllers: { sessions: "users/sessions" }

  # devise_for :users,
  #            controllers: {
  #              registrations: "users/registrations",
  #              confirmations: "users/confirmations",
  #              sessions: "users/sessions"
  #            }
  root "homes#index"
end

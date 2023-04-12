class UserResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  self.search_query = -> do
    scope.ransack(id_eq: params[:q], user_cont: params[:q], m: "or").result(
      distinct: false
    )
  end

  field :id, as: :id
  # Fields generated from the model
  field :email, as: :text
  field :sign_in_count, as: :number
  field :current_sign_in_at, as: :date_time
  field :last_sign_in_at, as: :date_time
  field :current_sign_in_ip, as: :text
  field :last_sign_in_ip, as: :text
  # field :confirmation_token, as: :text
  field :confirmed_at, as: :date_time
  field :confirmation_sent_at, as: :date_time
  field :unconfirmed_email, as: :text
  # field :failed_attempts, as: :number
  # field :unlock_token, as: :text
  # field :locked_at, as: :date_time
  field :role, as: :select, enum: ::User.roles
  # add fields here
end

class PurchaseRequestResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :delivery_date, as: :date_time
  field :user_id, as: :number
  field :requisition_amount, as: :number
  field :pr_creation_date, as: :date_time
  field :status, as: :text
  field :approved, as: :boolean
  # add fields here
end

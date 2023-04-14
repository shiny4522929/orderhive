class LocationResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :name_of_location, as: :text
  field :address, as: :text
  field :location_identification_code, as: :text
  field :postal, as: :text
  field :code, as: :text
  field :state, as: :text
  field :country, as: :country
  # add fields here
end

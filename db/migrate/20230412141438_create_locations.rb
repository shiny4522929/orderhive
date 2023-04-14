class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :name_of_location
      t.string :address
      t.string :location_identification_code
      t.string :postal
      t.string :code
      t.string :state
      t.string :country
      t.integer :user_id

      t.timestamps
    end
  end
end

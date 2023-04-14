class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :full_phone_number, :integer
    add_column :users, :phone_number, :integer
    add_column :users, :user_name, :string
    add_column :users, :organization, :string
    add_column :users, :country_code, :string
    add_column :users, :activated, :boolean
    add_column :users, :position, :string
  end
end

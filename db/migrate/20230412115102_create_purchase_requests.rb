class CreatePurchaseRequests < ActiveRecord::Migration[7.0]
    def change
      create_table :purchase_requests do |t|
        t.datetime :delivery_date
        t.integer :user_id
        t.float :requisition_amount
        t.datetime :pr_creation_date
        t.string :status
        t.boolean :approved
  
        t.timestamps
      end
    end
  end
  
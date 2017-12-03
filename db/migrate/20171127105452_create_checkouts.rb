class CreateCheckouts < ActiveRecord::Migration[5.0]
  def change
    create_table :checkouts do |t|
      t.string :email
      t.string :string
      t.string :phone_number
      t.string :string
      t.integer :order_id

      t.timestamps
    end
  end
end

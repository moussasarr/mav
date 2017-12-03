class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.float :subtotal
      t.float :total
      t.float :shopping

      t.timestamps
    end
  end
end

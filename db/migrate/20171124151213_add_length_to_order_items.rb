class AddLengthToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :length, :integer
  end
end

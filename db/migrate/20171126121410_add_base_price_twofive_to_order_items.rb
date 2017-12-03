class AddBasePriceTwofiveToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :base_price_twofive, :float
  end
end

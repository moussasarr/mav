class AddBasePriceOneToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :base_price_one, :float
  end
end

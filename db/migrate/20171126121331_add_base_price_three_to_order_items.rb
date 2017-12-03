class AddBasePriceThreeToOrderItems < ActiveRecord::Migration[5.0]
  def change
    add_column :order_items, :base_price_three, :float
  end
end

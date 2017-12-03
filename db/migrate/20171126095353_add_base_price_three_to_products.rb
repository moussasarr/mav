class AddBasePriceThreeToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :base_price_three, :float
  end
end

class AddBasePriceTwoToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :base_price_two, :float
  end
end

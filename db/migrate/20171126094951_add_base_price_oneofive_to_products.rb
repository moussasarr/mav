class AddBasePriceOneofiveToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :base_price_oneofive, :float
  end
end

class AddPricePerLengthToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :price_per_length, :float
  end
end

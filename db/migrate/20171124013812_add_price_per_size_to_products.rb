class AddPricePerSizeToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :price_per_size, :float
  end
end

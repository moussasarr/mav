class AddConstantPriceToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :constant_price, :string
    add_column :products, :float, :string
  end
end

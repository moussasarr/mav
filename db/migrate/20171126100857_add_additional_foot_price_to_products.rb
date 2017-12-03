class AddAdditionalFootPriceToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :additional_foot_price, :float
  end
end

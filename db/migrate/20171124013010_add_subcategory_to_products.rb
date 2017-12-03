class AddSubcategoryToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :subcategory, :string
  end
end

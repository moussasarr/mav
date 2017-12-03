class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.float :price
      t.integer :length
      t.float :weight
      t.string :name

      t.timestamps
    end
  end
end

class AddCreditCardNumberToCheckouts < ActiveRecord::Migration[5.0]
  def change
    add_column :checkouts, :credit_card_number, :integer,:limit => 25
    add_column :checkouts, :expiration_date, :string
    add_column :checkouts, :security_code, :integer
  end
end

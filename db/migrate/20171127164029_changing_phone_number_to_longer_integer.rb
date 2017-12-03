class ChangingPhoneNumberToLongerInteger < ActiveRecord::Migration[5.0]
  def change
  	def change
    remove_column :checkouts, :phone_number, :integer
    add_column :checkouts, :phone_number, :limit => 10

  end
  end
end

class AddPriceToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :price, :float
  end
end

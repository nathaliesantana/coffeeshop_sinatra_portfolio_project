class AddBeveragesIdToUsersTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :custom_beverage_id, :integer
  end
end

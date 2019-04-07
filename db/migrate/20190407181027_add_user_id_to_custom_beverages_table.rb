class AddUserIdToCustomBeveragesTable < ActiveRecord::Migration[5.2]
  def change
    add_column :custom_beverages, :user_id, :integer
  end
end

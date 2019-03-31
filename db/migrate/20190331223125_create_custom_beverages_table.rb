class CreateCustomBeveragesTable < ActiveRecord::Migration
  def change
    create_table :custom_beverages do |t|
      t.string :title
      t.text :content
    end
  end
end

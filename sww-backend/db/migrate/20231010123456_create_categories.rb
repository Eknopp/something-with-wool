class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :type, null: false
      t.string :main_category, null: false
      t.string :sub_category

      t.timestamps
    end
  end
end

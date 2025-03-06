class ChangeCategoryColumnNames < ActiveRecord::Migration[8.0]
  def change
    rename_column :categories, :main_category, :category_level_1
    rename_column :categories, :category_type, :category_level_2
    rename_column :categories, :sub_category, :category_level_3
    rename_column :categories, :sub_sub_category, :category_level_4
  end
end

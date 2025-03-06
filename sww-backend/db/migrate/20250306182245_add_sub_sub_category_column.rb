class AddSubSubCategoryColumn < ActiveRecord::Migration[8.0]
  def change
    add_column :categories, :sub_sub_category, :string
  end
end

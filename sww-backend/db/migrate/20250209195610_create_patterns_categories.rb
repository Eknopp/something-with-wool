class CreatePatternsCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :patterns_categories do |t|
      t.references :pattern_id, null: false
      t.references :category_id, null: false

      t.timestamps
    end

    add_foreign_key :patterns_categories, :patterns, column: :pattern_id
    add_foreign_key :patterns_categories, :categories, column: :category_id
  end
end

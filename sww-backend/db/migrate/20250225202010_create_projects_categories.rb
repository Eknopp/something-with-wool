class CreateProjectsCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :projects_categories do |t|
      t.references :project_id, null: false
      t.references :category_id, null: false

      t.timestamps
    end

    add_foreign_key :projects_categories, :projects, column: :project_id
    add_foreign_key :projects_categories, :categories, column: :category_id
  end
end

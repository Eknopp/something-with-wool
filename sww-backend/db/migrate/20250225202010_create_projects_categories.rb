class CreateProjectsCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :projects_categories do |t|
      t.references :project_id, null: false, foreign_key: true
      t.references :category_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end

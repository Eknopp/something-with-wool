class CreateProjectsYarns < ActiveRecord::Migration[8.0]
  def change
    create_table :projects_yarns do |t|
      t.references :project_id, null: false
      t.references :yarn_id, null: false

      t.timestamps
    end

    add_foreign_key :projects_yarns, :projects, column: :project_id
    add_foreign_key :projects_yarns, :yarns, column: :yarn_id
  end
end

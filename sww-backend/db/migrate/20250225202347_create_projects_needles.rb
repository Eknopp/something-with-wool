class CreateProjectsNeedles < ActiveRecord::Migration[8.0]
  def change
    create_table :projects_needles do |t|
      t.references :project_id, null: false
      t.references :needle_id, null: false

      t.timestamps
    end

    add_foreign_key :projects_needles, :projects, column: :project_id
    add_foreign_key :projects_needles, :needles, column: :needle_id
  end
end

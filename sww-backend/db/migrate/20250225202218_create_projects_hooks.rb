class CreateProjectsHooks < ActiveRecord::Migration[8.0]
  def change
    create_table :projects_hooks do |t|
      t.references :project_id, null: false
      t.references :hook_id, null: false

      t.timestamps
    end

    add_foreign_key :projects_hooks, :projects, column: :project_id
    add_foreign_key :projects_hooks, :hooks, column: :hook_id
  end
end

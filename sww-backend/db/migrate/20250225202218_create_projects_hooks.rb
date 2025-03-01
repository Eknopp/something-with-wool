class CreateProjectsHooks < ActiveRecord::Migration[8.0]
  def change
    create_table :projects_hooks do |t|
      t.references :project_id, null: false, foreign_key: true
      t.references :hook_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end

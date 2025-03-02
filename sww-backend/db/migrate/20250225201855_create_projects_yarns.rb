class CreateProjectsYarns < ActiveRecord::Migration[8.0]
  def change
    create_table :projects_yarns do |t|
      t.references :project, null: false, foreign_key: true
      t.references :yarn, null: false, foreign_key: true

      t.timestamps
    end
  end
end

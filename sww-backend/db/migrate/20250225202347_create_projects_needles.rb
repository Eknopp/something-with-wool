class CreateProjectsNeedles < ActiveRecord::Migration[8.0]
  def change
    create_table :projects_needles do |t|
      t.references :project, null: false, foreign_key: true
      t.references :needle, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateProjectsTags < ActiveRecord::Migration[8.0]
  def change
    create_table :projects_tags do |t|
      t.references :project, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end

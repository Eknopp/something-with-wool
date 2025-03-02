class CreateProjectsTags < ActiveRecord::Migration[8.0]
  def change
    create_table :projects_tags do |t|
      t.references :project_id, null: false
      t.references :tag_id, null: false

      t.timestamps
    end

    add_foreign_key :projects_tags, :projects, column: :project_id
    add_foreign_key :projects_tags, :tags, column: :tag_id
  end
end

class CreateIssues < ActiveRecord::Migration[8.0]
  def change
    create_table :issues do |t|
      t.references :magazine_id, null: false
      t.string :name, null: false
      t.string :pictures_path
      t.date :release_date, null: false

      t.timestamps
    end

    add_foreign_key :issues, :magazines, column: :magazine_id
  end
end

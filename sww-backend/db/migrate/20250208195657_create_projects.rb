class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.integer :user_id, null: false
      t.integer :pattern_id, null: false
      t.string :name
      t.string :status
      t.string :notes
      t.string :size
      t.decimal :stitches
      t.decimal :rows
      t.string :swatch_size
      t.string :gauge_pattern
      t.date :project_started
      t.date :project_finished
      t.timestamps
    end

    add_foreign_key :projects, :users, column: :user_id
    add_foreign_key :projects, :patterns, column: :pattern_id
  end
end

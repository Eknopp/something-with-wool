class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pattern, null: false, foreign_key: true
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
  end
end

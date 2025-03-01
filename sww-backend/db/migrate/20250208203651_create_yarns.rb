class CreateYarns < ActiveRecord::Migration[8.0]
  def change
    create_table :yarns do |t|
      t.integer :user_id, foreign_key: true
      t.string :weight
      t.decimal :meterage
      t.decimal :unit_weight
      t.string :weight
      t.string :gauge
      t.string :fibers
      t.string :texture
      t.boolean :machine_wash
      t.string :colors
      t.string :pictures_path
      t.string :dye
      t.string :origin
      t.text :notes
      t.timestamps
    end
  end
end

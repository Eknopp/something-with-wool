class CreatePatternsYarns < ActiveRecord::Migration[8.0]
  def change
    create_table :patterns_yarns do |t|
      t.references :pattern_id, null: false, foreign_key: true
      t.references :yarn_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end

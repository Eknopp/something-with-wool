class CreatePatternsYarns < ActiveRecord::Migration[8.0]
  def change
    create_table :patterns_yarns do |t|
      t.references :pattern_id, null: false
      t.references :yarn_id, null: false

      t.timestamps
    end

    add_foreign_key :patterns_yarns, :patterns, column: :pattern_id
    add_foreign_key :patterns_yarns, :yarns, column: :yarn_id
  end
end

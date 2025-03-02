class CreatePatternsNeedles < ActiveRecord::Migration[8.0]
  def change
    create_table :patterns_needles do |t|
      t.references :pattern_id, null: false
      t.references :needle_id, null: false

      t.timestamps
    end

    add_foreign_key :patterns_needles, :patterns, column: :pattern_id
    add_foreign_key :patterns_needles, :needles, column: :needle_id
  end
end

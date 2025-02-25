class CreatePatternsNeedles < ActiveRecord::Migration[8.0]
  def change
    create_table :patterns_needles do |t|
      t.references :pattern, null: false, foreign_key: true
      t.references :needle, null: false, foreign_key: true

      t.timestamps
    end
  end
end

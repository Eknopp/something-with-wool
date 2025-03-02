class CreatePatternsMagazines < ActiveRecord::Migration[8.0]
  def change
    create_table :patterns_magazines do |t|
      t.references :pattern_id, null: false
      t.references :magazine_id, null: false

      t.timestamps
    end

    add_foreign_key :patterns_magazines, :patterns, column: :pattern_id
    add_foreign_key :patterns_magazines, :magazines, column: :magazine_id
  end
end

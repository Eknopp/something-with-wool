class CreatePatternsMagazines < ActiveRecord::Migration[8.0]
  def change
    create_table :patterns_magazines do |t|
      t.references :pattern, null: false, foreign_key: true
      t.references :magazine, null: false, foreign_key: true

      t.timestamps
    end
  end
end

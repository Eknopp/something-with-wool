class CreatePatternTags < ActiveRecord::Migration[8.0]
  def change
    create_table :patterns_tags do |t|
      t.references :pattern, null: false, foreign_key: true
      t.references :tags, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreatePatternsTags < ActiveRecord::Migration[8.0]
  def change
    create_table :patterns_tags do |t|
      t.references :pattern_id, null: false
      t.references :tag_id, null: false

      t.timestamps
    end

    add_foreign_key :patterns_tags, :patterns, column: :pattern_id
    add_foreign_key :patterns_tags, :tags, column: :tag_id
  end
end

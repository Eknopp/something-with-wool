class CreatePatterns < ActiveRecord::Migration[8.0]
  def change
    create_table :patterns do |t|
      t.timestamps
      t.belongs_to :user, foreign_key: true, null: false
      t.integer :needle_id, foreign_key: true
      t.integer :yarn_id, foreign_key: true
      t.integer :category_id, foreign_key: true
      t.string :name, null: false
      t.string :craft_type, null: false
      t.float :price
      # TODO below and add the rest of relationship
      t.string :currency
      t.string :overall_yarn_weight
      t.integer :nbr_stitches
      t.integer :nbr_rows
      t.integer :swatch_size
      t.integer :repeats
      t.string :gauge_pattern
      t.integer :total_yardage
      t.string :languages, array: true, default: ["en"]
      t.string :sizes, array: true, default: []
      t.string :notes
      t.string :pictures_path
      t.string :pdf_path
      t.integer :view_count
      t.integer :likes
      t.integer :difficulty_rating
      t.integer :overall_rating
      t.date :first_published_date
      t.date :release_date
    end
  end
end

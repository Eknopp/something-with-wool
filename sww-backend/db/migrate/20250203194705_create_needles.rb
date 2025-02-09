class CreateNeedles < ActiveRecord::Migration[8.0]
  def change
    create_table :needles do |t|
      t.integer :pattern_id, foreign_key: true
      t.string :metric
      t.string :us_size
      t.string :uk_size
      t.timestamps
    end
  end
end

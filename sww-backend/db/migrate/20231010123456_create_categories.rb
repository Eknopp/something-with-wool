class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      # TODO
      t.integer :pattern_id, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end

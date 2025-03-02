class CreateYarnsNeedles < ActiveRecord::Migration[8.0]
  def change
    create_table :yarns_needles do |t|
      t.references :yarn, null: false, foreign_key: true
      t.references :needle, null: false, foreign_key: true

      t.timestamps
    end
  end
end

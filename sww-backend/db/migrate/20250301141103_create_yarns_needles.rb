class CreateYarnsNeedles < ActiveRecord::Migration[8.0]
  def change
    create_table :yarns_needles do |t|
      t.references :yarn_id, null: false
      t.references :needle_id, null: false

      t.timestamps
    end

    add_foreign_key :yarns_needles, :yarns, column: :yarn_id
    add_foreign_key :yarns_needles, :needles, column: :needle_id
  end
end

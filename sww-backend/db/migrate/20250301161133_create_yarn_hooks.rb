class CreateYarnHooks < ActiveRecord::Migration[8.0]
  def change
    create_table :yarns_hooks do |t|
      t.references :yarn, null: false, foreign_key: true
      t.references :hook, null: false, foreign_key: true

      t.timestamps
    end
  end
end

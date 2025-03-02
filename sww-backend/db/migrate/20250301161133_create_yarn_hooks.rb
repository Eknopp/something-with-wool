class CreateYarnHooks < ActiveRecord::Migration[8.0]
  def change
    create_table :yarns_hooks do |t|
      t.references :yarn_id, null: false
      t.references :hook_id, null: false

      t.timestamps
    end

    add_foreign_key :yarns_hooks, :yarns, column: :yarn_id
    add_foreign_key :yarns_hooks, :hooks, column: :hook_id
  end
end

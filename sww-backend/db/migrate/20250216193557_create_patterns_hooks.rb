class CreatePatternsHooks < ActiveRecord::Migration[8.0]
  def change
    create_table :patterns_hooks do |t|
      t.references :pattern_id, null: false
      t.references :hook_id, null: false

      t.timestamps
    end

    add_foreign_key :patterns_hooks, :patterns, column: :pattern_id
    add_foreign_key :patterns_hooks, :hooks, column: :hook_id
  end
end

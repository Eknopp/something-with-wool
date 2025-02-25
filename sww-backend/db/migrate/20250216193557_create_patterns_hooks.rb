class CreatePatternsHooks < ActiveRecord::Migration[8.0]
  def change
    create_table :patterns_hooks do |t|
      t.references :pattern, null: false, foreign_key: true
      t.references :hook, null: false, foreign_key: true

      t.timestamps
    end
  end
end

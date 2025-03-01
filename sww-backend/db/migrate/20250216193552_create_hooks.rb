class CreateHooks < ActiveRecord::Migration[8.0]
  def change
    create_table :hooks do |t|
      t.string :metric_mm, null: false
      t.string :us_size, null: false
      t.string :uk_size, null: false

      t.timestamps
    end
  end
end

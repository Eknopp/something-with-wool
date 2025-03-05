class DropNeedlesPatternsTable < ActiveRecord::Migration[8.0]
  def change
    drop_table :needles_patterns
  end
end

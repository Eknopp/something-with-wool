class CreateNeedles < ActiveRecord::Migration[8.0]
  def change
    create_table :needles do |t|
      t.string :metric_mm
      t.string :us_size
      t.string :uk_size

      t.timestamps
    end
  end
end

class AddColorToPatternsYarns < ActiveRecord::Migration[8.0]
  def change
    add_column :patterns_yarns, :color, :string
  end
end

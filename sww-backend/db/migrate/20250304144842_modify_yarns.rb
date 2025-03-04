class ModifyYarns < ActiveRecord::Migration[8.0]
  def change
    change_column_null :yarns, :weight, false
    change_column_null :yarns, :meterage, false
    change_column_null :yarns, :unit_weight, false
    change_column_null :yarns, :fibers, false

    remove_column :yarns, :colors, :string
    add_column :yarns, :colors, :string, array: true, default: []
  end
end

class AddNameToYarns < ActiveRecord::Migration[8.0]
  def change
    add_column :yarns, :name, :string
    Yarn.update_all(name: "Temporary Name")
    change_column_null :yarns, :name, false

    add_column :yarns, :brand_name, :string
  end
end

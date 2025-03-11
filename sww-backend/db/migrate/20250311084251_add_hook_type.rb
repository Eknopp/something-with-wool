class AddHookType < ActiveRecord::Migration[8.0]
  def change
    add_column :hooks, :hook_type, :string
  end
end

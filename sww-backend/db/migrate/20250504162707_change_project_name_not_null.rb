class ChangeProjectNameNotNull < ActiveRecord::Migration[8.0]
  def change
    change_column_null :projects, :name, false
  end
end

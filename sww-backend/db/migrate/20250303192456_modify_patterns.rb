class ModifyPatterns < ActiveRecord::Migration[8.0]
  def change
    change_column_null :patterns, :overall_yarn_weight, false
    change_column_null :patterns, :nbr_stitches, false
    change_column_null :patterns, :nbr_rows, false
    change_column_null :patterns, :swatch_size, false
    change_column_null :patterns, :pictures_path, false
    change_column_null :patterns, :pdf_path, false
    change_column_null :patterns, :first_published_date, false

    remove_column :patterns, :view_count, :integer
  end
end

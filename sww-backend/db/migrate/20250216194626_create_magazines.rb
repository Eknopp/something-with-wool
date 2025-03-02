class CreateMagazines < ActiveRecord::Migration[8.0]
  def change
    create_table :magazines do |t|
      t.integer :user_id, null: false
      t.string :name, null: false
      t.string :website
      t.string :cover_picture_path
      t.text :biography

      t.timestamps
    end

    add_foreign_key :magazines, :users, column: :user_id
  end
end

class CreateMagazines < ActiveRecord::Migration[8.0]
  def change
    create_table :magazines do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.string :website
      t.string :cover_picture_path
      t.text :biography

      t.timestamps
    end
  end
end

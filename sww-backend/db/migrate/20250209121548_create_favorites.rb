class CreateFavorites < ActiveRecord::Migration[8.0]
  def change
    create_table :favorites do |t|
      t.references :user, null: false
      t.references :favoritable, polymorphic: true, null: false

      t.timestamps
    end

    add_foreign_key :favorites, :users, column: :user_id
  end
end

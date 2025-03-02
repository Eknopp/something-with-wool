class CreateUserYarns < ActiveRecord::Migration[8.0]
  def change
    create_table :users_yarns do |t|
      t.references :user_id, null: false
      t.references :yarn_id, null: false

      t.timestamps
    end

    add_foreign_key :users_yarns, :users, column: :user_id
    add_foreign_key :users_yarns, :yarns, column: :yarn_id
  end
end

class CreateUserYarns < ActiveRecord::Migration[8.0]
  def change
    create_table :users_yarns do |t|
      t.references :user_id, null: false, foreign_key: true
      t.references :yarn_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateUserYarns < ActiveRecord::Migration[8.0]
  def change
    create_table :user_yarns do |t|
      t.references :user, null: false, foreign_key: true
      t.references :yarn, null: false, foreign_key: true

      t.timestamps
    end
  end
end

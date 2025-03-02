class CreateFollowers < ActiveRecord::Migration[8.0]
  def change
    create_table :followers do |t|
      t.references :user_id, null: false
      t.references :follower_id, null: false

      t.timestamps
    end

    add_foreign_key :followers, :users, column: :user_id
    add_foreign_key :followers, :users, column: :follower_id
  end
end

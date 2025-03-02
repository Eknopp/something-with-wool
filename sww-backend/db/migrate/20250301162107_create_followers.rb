class CreateFollowers < ActiveRecord::Migration[8.0]
  def change
    create_table :followers do |t|
      t.references :followee, null: false, foreign_key: {to_table: :users}
      t.references :follower, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end

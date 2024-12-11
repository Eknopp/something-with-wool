class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email_address, null: false
      t.string :password_digest, null: false
      t.string :name, null: false
      t.string :location
      t.string :username, null: false
      t.string :preferred_language, default: 'en'
      t.string :pronouns
      t.string :biography
      t.string :units, default: 'metric'
      t.boolean :private_profile, default: false
      t.string :role, default: 'user'
      t.string :website
      t.timestamps
    end
    add_index :users, :email_address, unique: true
    add_index :users, :username, unique: true
  end
end

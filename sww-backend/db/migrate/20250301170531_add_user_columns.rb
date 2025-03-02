class AddUserColumns < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :name, :string, null: false, default: "Anonymous"
    add_column :users, :location, :string
    add_column :users, :language, :string, null: false, default: "en"
    add_column :users, :pronouns, :string
    add_column :users, :biography, :text
    add_column :users, :units, :string, null: false, default: "metric"
    add_column :users, :role, :string, null: false, default: "user"
    add_column :users, :website, :string
    add_column :users, :preferred_currency, :string, null: false, default: "EUR"
  end
end

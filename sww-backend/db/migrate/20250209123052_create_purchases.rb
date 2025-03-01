class CreatePurchases < ActiveRecord::Migration[8.0]
  def change
    create_table :purchases do |t|
      t.references :user_id, null: false, foreign_key: true
      t.references :purchasable, polymorphic: true, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.string :currency, null: false, default: ["EUR"]
      t.date :purchase_date, null: false

      t.timestamps
    end
  end
end

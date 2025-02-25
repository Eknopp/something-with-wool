class CreateHooks < ActiveRecord::Migration[8.0]
  def change
    create_table :hooks do |t|
      # TODO
      t.timestamps
    end
  end
end

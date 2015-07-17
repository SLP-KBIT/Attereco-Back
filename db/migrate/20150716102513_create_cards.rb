class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :user_id, null: false
      t.string :idm

      t.timestamps null: false
    end
    add_index :cards, :user_id
  end
end

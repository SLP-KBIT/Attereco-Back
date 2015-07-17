class CreateAttends < ActiveRecord::Migration
  def change
    create_table :attends do |t|
      t.integer :user_id
      t.integer :schedule_id

      t.timestamps null: false
    end
    add_index :attends, :user_id
    add_index :attends, :schedule_id
  end
end

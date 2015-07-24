class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.timestamp :start_at
      t.timestamp :end_at
      t.string :place
      t.string :caption
      t.date :scheduled_date
      t.integer :assigned_user_id

      t.timestamps null: false
    end
  end
end

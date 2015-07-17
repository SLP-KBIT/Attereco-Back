class RemoveIsActiveToUser < ActiveRecord::Migration
  def change
    remove_column :users, :is_active
  end
end

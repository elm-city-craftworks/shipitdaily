class AddRemindersToPerson < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.integer :start_goal_reminder_offset
      t.text    :start_goal_reminder_time
      t.integer :finish_goal_reminder_offset
      t.text    :finish_goal_reminder_time
    end
  end
end

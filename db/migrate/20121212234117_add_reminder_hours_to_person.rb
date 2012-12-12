class AddReminderHoursToPerson < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.integer :start_goal_reminder_hour
      t.integer :finish_goal_reminder_hour
    end
  end
end

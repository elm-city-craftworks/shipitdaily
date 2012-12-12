class Person < ActiveRecord::Base
  attr_accessible :email, :start_goal_reminder_hour, :finish_goal_reminder_hour
  has_many :goals, :foreign_key => "author_id"

  def self.reminders_enabled
    where("email is not null")
  end
end

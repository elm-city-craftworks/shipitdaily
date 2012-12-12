class Person < ActiveRecord::Base
  attr_accessible :time_zone, :email, :start_goal_reminder_time, :finish_goal_reminder_time
  has_many :goals, :foreign_key => "author_id"

  before_save :update_start_goal_offset
  before_save :update_finish_goal_offset

  def self.reminders_enabled
    where("email is not null")
  end

  private

  def update_start_goal_offset
    hours, minutes = start_goal_reminder_time.split(":")

    write_attribute(:start_goal_reminder_offset, 
                    Integer(hours).hours + Integer(minutes).minutes)
  end

  def update_finish_goal_offset
    hours, minutes = finish_goal_reminder_time.split(":")

    write_attribute(:finish_goal_reminder_offset, 
                    Integer(hours).hours + Integer(minutes).minutes)
  end
end

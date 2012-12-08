class Person < ActiveRecord::Base
  has_many :goals, :foreign_key => "author_id"

  def self.reminders_enabled
    where("email is not null")
  end
end

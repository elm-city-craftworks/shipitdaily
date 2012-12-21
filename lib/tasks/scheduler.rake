task :start_goal_reminders => :environment do
  people = Person.reminders_enabled
                 .where(:start_goal_reminder_hour => Time.now.utc.hour)
    
  people.each do |person|
    Reminder.start_goal(person) unless person.goals.current.planned?
  end
end

task :finish_goal_reminders => :environment do
  people = Person.reminders_enabled
                 .where(:finish_goal_reminder_hour => Time.now.utc.hour)

  people.each do |person|
    Reminder.finish_goal(person) if person.goals.current.planned?
  end
end

task :ping do
  require 'net/http'
  
  uri = URI('http://www.shipitdaily.com')
  Net::HTTP.get(uri) # => String
end

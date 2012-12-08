task :start_goal_reminders => :environment do
  Person.reminders_enabled.each do |person|
    Reminder.start_goal(person) if person.goals.current.undefined?
  end
end

task :finish_goal_reminders => :environment do
  Person.reminders_enabled.each do |person|
    Reminder.finish_goal(person) if person.goals.current.planned?
  end
end

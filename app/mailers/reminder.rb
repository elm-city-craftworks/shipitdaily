class Reminder < ActionMailer::Base
  default :from => "gregory@practicingruby.com"

  def start_goal(recipient)
    mail(:to => recipient.email, :subject => "What will you ship today?").deliver
  end

  def finish_goal(recipient)
    mail(:to => recipient.email, :subject => "Did you ship today?").deliver
  end
end

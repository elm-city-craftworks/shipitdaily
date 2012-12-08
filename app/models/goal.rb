class Goal < ActiveRecord::Base
  attr_accessible :description, :completed, :state

  belongs_to :author, :class_name => "Person"

  def self.current
    where("created_at > ?", Date.today - 1).order("created_at desc").first || 
    Goal.new(:state => "undefined")
  end

  def self.plan(description)
    create(:description => description, :state => "planned")
  end

  def complete
    update_attribute(:state, "completed")
  end

  def abandon
    update_attribute(:state, "abandoned")
  end

  def undefined?
    state == "undefined"
  end

  def completed?
    state == "completed"
  end

  def abandoned?
    state == "abandoned"
  end

  def planned?
    state == "planned"
  end
end

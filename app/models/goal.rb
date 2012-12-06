class Goal < ActiveRecord::Base
  attr_accessible :description, :completed, :author_id 

  belongs_to :author, :class_name => "Person"
end

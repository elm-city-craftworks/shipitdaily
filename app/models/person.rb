class Person < ActiveRecord::Base
  has_many :goals, :foreign_key => "author_id"
end

class Person < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :goals, :foreign_key => "author_id"
end

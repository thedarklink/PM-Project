class Project < ApplicationRecord
  has_many :sprints
  has_many :backlogitems

end

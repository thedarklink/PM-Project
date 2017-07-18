class Sprint < ApplicationRecord
  belongs_to :project
  has_many :backlogitems
  has_many :tasks
end

class Backlogitem < ApplicationRecord
  belongs_to :project
  has_many :tasks

  enum state: [ :New, :Approved, :Committed, :Done, :Removed ]
  enum priorty: [:Low, :Normal, :High ]
end

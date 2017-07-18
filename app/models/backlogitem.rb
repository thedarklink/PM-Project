class Backlogitem < ApplicationRecord
  belongs_to :project
  belongs_to :sprint
  has_many :tasks

  enum state: [ :New, :Approved, :Committed, :Done, :Removed ]
  enum priorty: [:Low, :Normal, :High ]

  validates :title, :presence => true

end

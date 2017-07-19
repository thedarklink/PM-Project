class Backlogitem < ApplicationRecord
  belongs_to :project
  belongs_to :sprint, optional: true
  has_many :tasks

  enum state: [ :New, :Approved, :Committed, :Done, :Removed ]
  enum priorty: [:Low, :Medium, :High ]

  validates :title, :presence => true

end

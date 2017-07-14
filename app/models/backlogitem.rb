class Backlogitem < ApplicationRecord
  belongs_to :project

  enum state: [ :New, :Approved, :Committed, :Done, :Removed ]
  enum priorty: [:Low, :Normal, :High ]
end

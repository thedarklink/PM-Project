class Task < ApplicationRecord
  belongs_to :backlogitem

  enum state: [ :New, :Done, :InProgress]
  enum priorty: [:Low, :Normal, :High ]
end

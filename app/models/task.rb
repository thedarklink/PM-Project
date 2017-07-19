class Task < ApplicationRecord
  belongs_to :backlogitem
  belongs_to :sprint, optional: true

  enum state: [ :New, :Done, :InProgress]
  enum priority: [:Low, :Medium, :High ]

  validates :title, :presence => true

end

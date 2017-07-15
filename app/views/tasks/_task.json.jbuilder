json.extract! task, :id, :title, :description, :author, :creationdate, :assignedto, :state, :priority, :remainingwork, :effort, :created_at, :updated_at
json.url task_url(task, format: :json)

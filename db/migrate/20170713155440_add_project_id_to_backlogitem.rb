class AddProjectIdToBacklogitem < ActiveRecord::Migration[5.1]
  def change
    add_column :backlogitems, :project_id, :integer
  end
end

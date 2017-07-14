class AddProjectIdToSprint < ActiveRecord::Migration[5.1]
  def change
    add_column :sprints, :project_id, :integer
  end
end

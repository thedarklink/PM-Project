class AddSprintreviewToSprints < ActiveRecord::Migration[5.1]
  def change
    add_column :sprints, :sprintreview, :text
  end
end

class AddBacklogitemIdToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :backlogitem_id, :integer
  end
end

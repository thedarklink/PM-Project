class AddColumnToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :sprint_id, :integer
  end
end

class ChangeDataTypeForFieldnameBacklogitem < ActiveRecord::Migration[5.1]
  def change
    change_column :backlogitems, :updated_at, :date
  end
end

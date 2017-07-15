class ChangeDataTypeForFieldname < ActiveRecord::Migration[5.1]
  def change
    change_column :projects, :dueDate, :date
  end
end

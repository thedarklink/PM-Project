class ChangeDataTypeForCreatedAt < ActiveRecord::Migration[5.1]
  def change
    change_column :tasks, :updated_at, :date
  end
end

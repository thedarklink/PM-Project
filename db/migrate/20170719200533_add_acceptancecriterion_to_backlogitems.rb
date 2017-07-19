class AddAcceptancecriterionToBacklogitems < ActiveRecord::Migration[5.1]
  def change
    add_column :backlogitems, :acceptancecriterion, :text
  end
end

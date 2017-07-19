class AddRetroperspectiveToSprints < ActiveRecord::Migration[5.1]
  def change
    add_column :sprints, :retroperspective, :text
  end
end

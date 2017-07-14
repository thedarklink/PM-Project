class CreateBacklogitems < ActiveRecord::Migration[5.1]
  def change
    create_table :backlogitems do |t|
      t.string :title
      t.text :description
      t.string :author
      t.date :creationdate
      t.string :assignedto
      t.integer :state
      t.integer :priorty
      t.integer :effort

      t.timestamps
    end
  end
end

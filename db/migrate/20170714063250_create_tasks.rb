class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.string :author
      t.date :creationdate
      t.string :assignedto
      t.integer :state
      t.integer :priority
      t.integer :remainingwork
      t.integer :effort

      t.timestamps
    end
  end
end

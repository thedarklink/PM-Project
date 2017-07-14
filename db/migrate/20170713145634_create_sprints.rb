class CreateSprints < ActiveRecord::Migration[5.1]
  def change
    create_table :sprints do |t|
      t.string :name
      t.date :startDate
      t.date :endDate
      t.integer :effort
      t.integer :remainingWork

      t.timestamps
    end
  end
end

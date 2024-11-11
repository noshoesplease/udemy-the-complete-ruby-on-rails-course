class CreateProjects < ActiveRecord::Migration[7.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :details
      t.date :expected_completion_date
      t.belongs_to :team, null: false, foreign_key: true

      t.timestamps
    end
  end
end

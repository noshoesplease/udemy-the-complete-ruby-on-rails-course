class CreateCourses < ActiveRecord::Migration[7.2]
  def change
    create_table :courses do |t|
      t.timestamps
      t.string :short_name
      t.string :name
      t.text :description
    end
  end
end

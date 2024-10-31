class CreateStudents < ActiveRecord::Migration[7.2]
  def change
    create_table :students do |t|
      t.timestamps
      t.string :name
      t.string :email
    end
  end
end

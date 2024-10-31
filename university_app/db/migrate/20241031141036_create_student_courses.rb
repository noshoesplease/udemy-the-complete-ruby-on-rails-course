class CreateStudentCourses < ActiveRecord::Migration[7.2]
  def change
    create_table :student_courses do |t|
      t.timestamps
      t.integer :student_id
      t.integer :course_id
    end
  end
end

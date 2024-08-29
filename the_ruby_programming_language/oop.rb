class University
  attr_accessor :students, :courses
end

class Student
  attr_accessor :first_name, :last_name, :email, :student_id

  def initialize(first_name, last_name, email, student_id)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @student_id = student_id
  end
  
  def to_s
    "Student-#{student_id}: #{first_name} #{last_name} (#{email})"
  end
end

class Course
  attr_accessor :name, :description, :course_id
end

class BookStore
  attr_accessor :books, :employees
end

class Book
  attr_accessor :isbn, :title, :author
end

class Employee
  attr_accessor :ssn, :first_name, :last_name, :email, :employee_id
end

def oop_exercise1
  puts
  puts "oop_exercise1"
  puts
  
  student = Student.new "Devin", "Durgan", "devin.durgan@mail.com", 1
  puts student
  puts

  student = Student.new "Atlas", "Smurgan", "atlas.smurgan@mail.com", 2
  puts student
  puts
end
# oop_exercise1

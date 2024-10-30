class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = "Student was created successfully"
      redirect_to students_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      flash[:notice] = "Student was updated successfully"
      redirect_to @student
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end
end

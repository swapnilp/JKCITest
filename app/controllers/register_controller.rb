class RegisterController < ApplicationController

  before_action :find_exam
  
  def new
    @student = Student.new
  end
  
  def create
    @student = Student.where(mobile: student_params[:mobile]).first
    if @student.nil?
      @student = Student.new(student_params)
    else
      @student.update(student_params)
    end
    if @student.save!
      student_exam = @student.attend_exam(@exam)
      if student_exam.present?
        redirect_to new_exam_register_path(@exam)
      else
        redirect_to new_exam_register_path(@exam)
      end
    else
      render :new
    end
  end

  def student_params
    params.require(:student).permit(:name, :address, :mobile)
  end
end

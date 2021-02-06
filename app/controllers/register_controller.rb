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

    if @student.save
      student_exam = @student.attend_exam(@exam)
      if student_exam.present?
        bypass_sign_in(student_exam)
        redirect_to question_path(1)
      else
        redirect_to new_exam_register_path(@exam), notice: "Exam Already Attempted"
      end
    else
      respond_to do |format|
        format.html {render 'new'}
        format.js
      end
    end
  end

  def student_params
    params.require(:student).permit(:name, :address, :mobile)
  end
end

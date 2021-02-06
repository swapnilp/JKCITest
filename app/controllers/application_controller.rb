class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def find_exam
    @exam = Exam.find(params[:exam_id])
  end

  def find_student_exam
    @student_exam = StudentExam.find(params[:student_exam_id])
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:student_id, :exam_id])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:student_id, :exam_id])
  end

  def after_sign_in_path_for(resource)
    question_path(1)
  end
  
end

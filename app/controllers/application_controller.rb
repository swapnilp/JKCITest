class ApplicationController < ActionController::Base

  
  def find_exam
    @exam = Exam.find(params[:exam_id])
  end
end

class ApplicationController < ActionController::Base

  
  def find_exam
    @exam = Exam.find(params[:exam_id])
  end

  def find_student_exam
    @student_exam = StudentExam.find(params[:student_exam_id])
  end
end

class QuestionController < ApplicationController

  before_action :authenticate_student_exam!, except: [:finish_exam]

  
  def show
    p current_student_exam
    #@question = ExamsQuestion.where(exam_id: @exam.id, question_id: params[:question_id]).first
    @questions = current_student_exam.student_exams_questions.remaining
    @question = @questions.first
  end

  def update_answer
    @question = current_student_exam.student_exams_questions.find(params[:id])
    if @question.update(question_params)
      if current_student_exam.student_exams_questions.remaining.count > 0 
        redirect_to question_path(1)
      else
        sign_out(current_student_exam)
        redirect_to finish_exam_path
      end
    else
      @questions = current_student_exam.student_exams_questions.remaining
      render :show
    end
  end

  def finish_exam
  end

  def question_params
    params.require(:student_exams_question).permit(:student_answer)
  end 
end

class QuestionController < ApplicationController
  def show
    @exam = Exam.where(id: params[:exam_id]).first
    @question = ExamsQuestion.where(exam_id: @exam.id, question_id: params[:question_id]).first
  end

  def update_answer
    @exam = Exam.where(id: params[:exam_id]).first
    @question = Question.where(id: params[:id]).first
  end
end

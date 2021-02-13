class StudentExamsQuestion < ApplicationRecord

  belongs_to :student
  belongs_to :student_exam
  belongs_to :exams_question
  belongs_to :question

  scope :remaining, -> { where(student_answer: nil) }

  def check_exam
    unless student_answer.nil?
      self.update(is_correct: self.question.answer == self.student_answer)
    end
  end
  
end

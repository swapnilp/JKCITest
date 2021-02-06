class StudentExam < ApplicationRecord
  belongs_to :student
  belongs_to :exam
  has_many :student_exams_questions

  after_create :plot_questions

  def plot_questions
    exam.exams_questions.each do |exam_question|
      self.student_exams_questions.new(student_id: self.student_id, student_exam_id: self.id,
                                            question_id: exam_question.question_id, exams_question_id: exam_question.id).save!
    end
  end
end

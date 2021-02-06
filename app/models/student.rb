class Student < ApplicationRecord
  has_many :student_exams

  has_many :exams, through: :student_exams


  def attend_exam(exam)
    if student_exams.where(exam_id: exam.id).present?
      return false
    else
      exam = student_exams.new(exam_id: exam.id)
      exam.save!
      return exam
    end
  end

end

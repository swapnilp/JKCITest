class Student < ApplicationRecord
  has_many :student_exams

  has_many :exams, through: :student_exams


  def attend_exam(exam)
    if student_exams.where(exam_id: exam.id).present?
      return false
    else
      student_exams.new(exam_id: exam.id).save!
      return true
    end
  end

end

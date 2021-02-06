class Student < ApplicationRecord
  has_many :student_exams

  has_many :exams, through: :student_exams

  validates :mobile,:presence => true,
            :numericality => true,
            :length => { :minimum => 10, :maximum => 15 }
  
  def attend_exam(exam)
    if student_exams.where(exam_id: exam.id).present?
      return false
    else
      ex = student_exams.new(exam_id: exam.id)
      ex.save(validate: false)
      return ex
    end
  end

end

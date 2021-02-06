class StudentExamsQuestion < ApplicationRecord

  belongs_to :student
  belongs_to :student_exam
  belongs_to :exams_question
  belongs_to :question
  
end

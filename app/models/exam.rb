class Exam < ApplicationRecord
  
  has_many :exams_questions
  has_many :student_exams
  has_many :questions, through: :exams_questions

  
  
end

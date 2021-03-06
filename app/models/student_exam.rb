class StudentExam < ApplicationRecord

  devise :database_authenticatable
  
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

  def email
    
  end

  def password_required?
    return false 
  end

  def encrypted_password
    return ""
  end

  def unsolved_questions
    student_exams_questions.map(&:student_answer).select(&:blank?).count
  end

  def solved_questions
    student_exams_questions.map(&:student_answer).reject(&:blank?).count
  end

  def marks
    student_exams_questions.map(&:is_correct).count(true)
  end

  def student_data
    {name: student.name, mobile: student.mobile, unsolved: unsolved_questions, solved: solved_questions, marks: marks, date: created_at.to_date}
  end
end

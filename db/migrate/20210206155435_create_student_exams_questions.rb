class CreateStudentExamsQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :student_exams_questions do |t|
      t.references :student
      t.references :student_exam
      t.references :question
      t.references :exams_question
      t.string :student_answer
      t.boolean :is_correct
      t.timestamps
    end
  end
end

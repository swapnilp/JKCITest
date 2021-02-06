class CreateStudentExams < ActiveRecord::Migration[6.0]
  def change
    create_table :student_exams do |t|
      t.references :student
      t.references :exam
      t.timestamps
    end
  end
end

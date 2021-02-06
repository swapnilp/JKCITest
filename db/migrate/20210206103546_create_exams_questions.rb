class CreateExamsQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :exams_questions do |t|
      t.references :exam
      t.references :question
      t.timestamps
    end
  end
end

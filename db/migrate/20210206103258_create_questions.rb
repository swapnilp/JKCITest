class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :question
      t.string :opt1
      t.string :opt2
      t.string :opt3
      t.string :opt4
      t.string :answer
      t.timestamps
    end
  end
end

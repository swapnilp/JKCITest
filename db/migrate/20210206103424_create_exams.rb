class CreateExams < ActiveRecord::Migration[6.0]
  def change
    create_table :exams do |t|
      t.string :name
      t.boolean :is_live, default: true
      t.timestamps
    end
  end
end

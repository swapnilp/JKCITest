class ExamsQuestion < ApplicationRecord

  belongs_to :exam
  belongs_to :question
end

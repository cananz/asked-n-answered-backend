class Answer < ApplicationRecord
  belongs_to :prompt
  # belongs_to :project, through: :prompt
end

class Prompt < ApplicationRecord
  has_many :answers
  belongs_to :project

  def pass_answers
    self.answers.map do |answer|
      {
        id: answer.id,
        content: answer.content,
        correct: answer.correct,
        selected: false
      }
    end
  end

end

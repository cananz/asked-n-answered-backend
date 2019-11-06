class Prompt < ApplicationRecord
  has_many :answers
  belongs_to :project

  def pass_answers
    self.answers.map do |answer|
      {
        content: answer.content,
        value: answer.correct
      }
    end
  end

end

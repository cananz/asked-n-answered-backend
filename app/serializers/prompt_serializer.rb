class PromptSerializer < ActiveModel::Serializer
  attributes :id, :content, :img, :prompt_type, :answers
  # has_many :answers
  # belongs_to :project

  def answers
    self.object.answers.select(:content, :correct, :id)
  end
end

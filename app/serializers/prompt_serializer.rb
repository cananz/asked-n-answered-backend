class PromptSerializer < ActiveModel::Serializer
  attributes :id, :content, :img, :prompt_type, :answers


  def answers
    self.object.answers.select(:content, :correct, :id)
  end
end

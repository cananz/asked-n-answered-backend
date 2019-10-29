class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :prompt_id, :content, :correct
end

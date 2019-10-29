class PromptSerializer < ActiveModel::Serializer
  attributes :id, :project_id, :content, :img, :type
end

class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :user_email, :title, :subtitle, :prompts

  def prompts
    self.object.prompts.map do |prompt_obj|
      {
        id: prompt_obj.id,
        prompt_content: prompt_obj.content,
        prompt_type: prompt_obj.prompt_type,
        correct_answer: prompt_obj.answers.select(:id, :content).find_by(correct: true),
        incorrect_answers: prompt_obj.answers.select(:id, :content).where(correct: false)
      }
    end
  end

  def user_email
    self.object.user.email
  end

end

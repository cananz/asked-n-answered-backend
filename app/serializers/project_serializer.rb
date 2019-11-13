class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :user, :title, :subtitle, :live, :pin, :prompts

  def prompts
    self.object.prompts.map do |prompt_obj|
      {
        id: prompt_obj.id,
        content: prompt_obj.content,
        img: prompt_obj.img,
        type: prompt_obj.prompt_type,
        correctAnswer: prompt_obj.answers.select(:id, :content).find_by(correct: true),
        incorrectAnswers: prompt_obj.answers.select(:id, :content).where(correct: false)
      }
    end
  end

  def user
    self.object.user.email
  end

  def live
    if self.object.sessions.where(is_live: true).count > 0
      return true
    else
      return false
    end
  end

  def pin
    self.object.sessions.first.pin
  end

end

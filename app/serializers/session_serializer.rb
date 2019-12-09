class SessionSerializer < ActiveModel::Serializer
  attributes :id, :pin, :projectId, :is_live, :host, :title, :subtitle, :prompts

  def projectId
    self.object.project.id
  end

  def host
    self.object.project.user.email
  end

  def prompts
    self.object.project.prompts.map do |prompt_obj|
      {
        id: prompt_obj.id,
        content: prompt_obj.content,
        img: prompt_obj.img,
        # type: prompt_obj.prompt_type,
        correctAnswer: prompt_obj.answers.select(:id, :content).find_by(correct: true),
        incorrectAnswers: prompt_obj.answers.select(:id, :content).where(correct: false)
      }
    end
  end

  def title
    self.object.project.title
  end

  def subtitle
    self.object.project.subtitle
  end

end

class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :user, :title, :subtitle, :prompts

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

  # def pin
  #   self.object.sessions.pin
  # end

end

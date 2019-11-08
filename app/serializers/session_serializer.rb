class SessionSerializer < ActiveModel::Serializer
  attributes :id, :pin, :is_live, :host, :title, :subtitle, :prompts

  def host
    self.object.project.user.email
  end

  def prompts
    self.object.project.prompts.map do |prompt_obj|
      {
        id: prompt_obj.id,
        content: prompt_obj.content,
        image: prompt_obj.img,
        answers: prompt_obj.pass_answers
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

class SessionSerializer < ActiveModel::Serializer
  attributes :id, :pin, :is_live#, :project #, :host_email
  belongs_to :project
  # def project
  #   project = self.object.project
  #   return {
  #     id: self.object.project.id,
  #     title: self.object.project.title,
  #     subtitle: self.object.project.subtitle
  #   }
  # end

  def host_email
    self.object.project.user.email
  end

  # def responses
  #   # self.object
  # end


end

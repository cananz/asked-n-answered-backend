class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :projects

# set up how I want each user's projects to be structured on user_path
  def projects
    self.object.projects.map do |project_obj|
      {
        id: project_obj.id,
        title: project_obj.title,
        subtitle: project_obj.subtitle
      }
    end
  end
  
end

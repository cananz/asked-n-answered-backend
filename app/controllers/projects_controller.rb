class ProjectsController < ApplicationController

  def index
    projects = Project.all

    render json: projects, include: [:prompt]
  end

  def show
    project = Project.find(params[:id])
    prompts = project.prompts

    render json: project
  end

  # def create
  # end
  #
  # def update
  # end

end

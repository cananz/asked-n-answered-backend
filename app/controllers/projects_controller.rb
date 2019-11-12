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

  def create
    empty_prompt = Prompt.create
    empty_prompt.answers = [Answer.create(correct: true), Answer.create(correct: false), Answer.create(correct: false), Answer.create(correct: false)]

    project = Project.create({
      user_id: params[:user_id],
      title: params[:title],
      subtitle: params[:subtitle],
      prompts: [empty_prompt]
      })

      # byebug

    render json: project
  end

  def update
    project = Project.find(params[:id])
    byebug
    # project.update()
  end







  private

  def project_params

  end

end

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
    # empty_prompt = Prompt.create
    # empty_prompt.answers = [Answer.create(correct: true), Answer.create(correct: false), Answer.create(correct: false), Answer.create(correct: false)]

    project = Project.create({
      user_id: params[:user_id],
      title: params[:title],
      subtitle: params[:subtitle]#,
      # prompts: [empty_prompt]
      })

    session = Session.create(project: project, is_live: false)
      # byebug

    render json: project
  end

  def update
    project = Project.find(params[:id])
    content = params[:content]
    img = params[:img]
    prompt = Prompt.create(project: project, content: content, img: img)
    wrong = params[:incorrectAnswers]
    # byebug
    Answer.create(content: params[:correctAnswer], correct: true, prompt: prompt)
    wrong.each {|answer| Answer.create(content: answer, correct: false, prompt: prompt)}

    projects = project.user.projects
    render json: projects
  end

def toggle_session
  project = Project.find(params[:id])
  # session = Session.find_by(pin: params[:pin])
  session = project.sessions.first
  # byebug
  session.update(is_live: !session.is_live)

  render json: project
end





  private

  def project_params

  end

end

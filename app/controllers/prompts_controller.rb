class PromptsController < ApplicationController
  def index
    prompts = Prompt.all
    render json: prompts
  end

  def show
    prompt = Prompt.find(params[:id])
    render json: prompt
  end

  def destroy
    prompt = Prompt.find(params[:id])
    project = prompt.project
    prompt.destroy
    # byebug
    render json: project
  end
end

class PromptsController < ApplicationController
  def index
    prompts = Prompt.all
    render json: prompts
  end

  def show
    prompt = Prompt.find(params[:id])
    render json: prompt
  end
end

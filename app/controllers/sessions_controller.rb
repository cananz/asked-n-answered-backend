class SessionsController < ApplicationController
  def index
    sessions = Session.all
    render json: sessions
  end

  def show
    session = Session.find(params[:id])
    render json: session
  end

  # def create
  #
  # end
end

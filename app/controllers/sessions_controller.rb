class SessionsController < ApplicationController
  def index
    sessions = Session.check_session_list
    # byebug
    render json: sessions
  end

  def show

    session = Session.find_by(pin: params[:pin])
    render json: session
  end

  # def create
  #
  # end
end

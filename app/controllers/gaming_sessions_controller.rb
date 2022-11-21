class GamingSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @gaming_sessions = GamingSession.all
  end

  def show
    @gaming_session = GamingSession.find(params[:id])
  end

  def new
    @gaming_session = GamingSession.new
  end

  def create
    @gaming_session = GamingSession.new(gaming_sessions_params)
    @gaming_session.user = current_user
    if @gaming_session.save
      redirect_to gaming_session_path(@gaming_session)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def gaming_sessions_params
    params.require(:gaming_session).permit(:name, :date, :number_of_participants, :address, :game, :description)
  end
end

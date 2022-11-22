class GamingSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_gaming_session, only: [:show, :edit, :update, :destroy]

  def index
    @gaming_sessions = policy_scope(GamingSession)
  end

  def show
    authorize @gaming_session
    @booking = Booking.new
  end

  def new
    @gaming_session = GamingSession.new
    authorize @gaming_session
  end

  def create
    @gaming_session = GamingSession.new(gaming_sessions_params)
    @gaming_session.user = current_user
    authorize @gaming_session
    if @gaming_session.save
      redirect_to gaming_session_path(@gaming_session)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @gaming_session

  end

  def update
    authorize @gaming_session
    @gaming_session.update(gaming_sessions_params)
    redirect_to gaming_session_path(@gaming_session)
  end

  def destroy
    authorize @gaming_session
    @gaming_session.destroy
    redirect_to gaming_sessions_path
  end

  private

  def gaming_sessions_params
    params.require(:gaming_session).permit(:name, :date, :number_of_participants, :address, :game, :description, photos: [])
  end

  def set_gaming_session
    @gaming_session = GamingSession.find(params[:id])
  end
end

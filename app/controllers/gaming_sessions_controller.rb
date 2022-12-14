class GamingSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_gaming_session, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query]
      @gaming_sessions = policy_scope(GamingSession)
      sql_query = "name ILIKE :query OR address ILIKE :query"
      @gaming_sessions = GamingSession.where(sql_query, query: "%#{params[:query]}%")
    elsif params[:gaming_session]
      @gaming_sessions = policy_scope(GamingSession)
      @gaming_sessions = GamingSession.where("game_type IN (?)", params[:gaming_session][:game_type])
    else
      @gaming_sessions = policy_scope(GamingSession)
    end
    @markers = @gaming_sessions.geocoded.map do |gaming_session|
      {
        lat: gaming_session.latitude,
        lng: gaming_session.longitude,
        info_window: render_to_string(partial: "info_window", locals: {gaming_session: gaming_session}),
        image_url: helpers.asset_url("location.png")
      }
    end
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
    params.require(:gaming_session).permit(:name, :date, :number_of_participants, :game_type, :food, :drink, :address, :game, :description, :price, photos: [])
  end

  def set_gaming_session
    @gaming_session = GamingSession.find(params[:id])
  end
end

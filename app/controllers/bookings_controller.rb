class BookingsController < ApplicationController
  before_action :set_gaming_session, only: %i[create]

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.gaming_session = @gaming_session
    # @gaming_session.booking = @booking
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_path, notice: "succesfully done"
      # a rediriger sur le dashboard du user
    else
      render 'gaming_sessions/show', status: :unprocessable_entity
    end
  end

  def dashboard
    @my_bookings = Booking.where(user: current_user)
    authorize @my_bookings
    @my_gaming_sessions = current_user.gaming_sessions
    @my_demands = Booking.where(gaming_session: @my_gaming_sessions)
  end

  def accept
    @demand = Booking.find(params[:id])
    authorize @demand
    @demand.status = true
    if @demand.save
      redirect_to dashboard_path
    else
      render :dashboard, status: :unprocessable_entity
    end
  end

  def refuse
    @demand = Booking.find(params[:id])
    authorize @demand
    @demand.status = false
    if @demand.save
      redirect_to dashboard_path
    else
      render :dashboard, status: :unprocessable_entity
    end
  end

  private

  def set_gaming_session
    @gaming_session = GamingSession.find(params[:gaming_session_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end

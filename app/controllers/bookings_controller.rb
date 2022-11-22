class BookingsController < ApplicationController
  before_action :set_gaming_session, only: %i[create]

  def create
    # @user = User.find(params[:user_id])
    @booking = Booking.new(booking_params)
    @booking.gaming_session = @gaming_session
    # @booking.user = @user
    if @booking.save
      redirect_to gaming_session_path(@gaming_session)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_gaming_session
    @gaming_session = GamingSession.find(params[:gaming_session_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
    # status ?
  end
end

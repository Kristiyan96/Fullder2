class ReservationsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_restaurant

  def new
    @reservation = @restaurant.reservations.build
  end

  def create
    @reservation = @restaurant.reservations.new(reservation_params)
    @reservation.user_id = current_user.id

    respond_to do |format|
      if @reservation.save
        format.html do
          redirect_to restaurant_path(@restaurant),
                      notice: 'Reservation was successfully created.',
                      status: :created
        end
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def reservation_params
    params.require(:reservation).permit(:from_time)
  end
end

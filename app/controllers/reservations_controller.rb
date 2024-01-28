class ReservationsController < ApplicationController

    def index
  if user_signed_in?
     @user_reservations = current_user.reservations
  else
    redirect_to new_user_session_path, alert: 'Veuillez vous connecter pour voir vos réservations.'
  end
  end


    def new
    @flat = Flat.find(params[:flat_id])
    @reservation = Reservation.new
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @reservation = @flat.reservations.build(reservation_params)
    @reservation.user = current_user
    @reservation.status = 'En attente de validation'

    if verif && @reservation.save
      redirect_to flat_reservation_path(@flat, @reservation), notice: 'Réservation créée avec succès!'
    else
      redirect_to flat_path(@flat), notice: 'Réservation impossible sur ces dates.'
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @reservation = Reservation.new
  end


  private

  def reservation_params
    params.require(:reservation).permit(:start_reservation, :end_reservation, :user_id)
  end
end

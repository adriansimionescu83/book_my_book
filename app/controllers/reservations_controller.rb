class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update destroy]

  def index
    @reservations = policy_scope(Reservation)
  end

  def show
    authorize @reservation
  end

  def new
    authorize @reservation
  end

  def create
    authorize @reservation
  end

  def edit
    authorize @reservation
  end

  def update
    authorize @reservation
  end

  def destroy
    authorize @reservation
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end

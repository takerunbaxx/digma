class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new,:show,:create, :confirmation]
  before_action :authenticate_admin!, only: [:adminside_index, :adminside_show]
  
  def index
    require "date"
    @reservations=current_user.reservations.order(id: :desc).page(params[:page]).per(25)
    @past_reservations=current_user.reservations.where("start_date < ?", Date.today)
    @liked_admin = current_user.likings.order(id: :desc).page(params[:page]).per(25)
  end
  
  def new
    @reservation=Reservation.new
    @package=Package.find(params[:package_id])
  end
  
  def confirmation
    package=Package.find(params[:package_id])
    @reservation=package.reservations.build(reservation_params)
    #render :new if @reservation.invalid?
  end
  
  def back
    package=Package.find(params[:package_id])
    @reservation=package.reservations.build(back_params)
    render :new
  end
  
  def show
    @reservation=Reservation.find(params[:id])
  end
  
  
  def create
    package=Package.find(params[:package_id])
    @reservation=package.reservations.build(reservation_params)
    @reservation.user_id=current_user.id
    if @reservation.save!
    flash[:notice] = "予約が完了しました"
    redirect_to user_url(current_user.id)
    package.create_notification_reservation!(current_user)
    end
  end
  
  def destroy
    package=Package.find(params[:id])
    current_user.cancel(package)
    flash[:alert] = "予約をキャンセルしました"
    redirect_to reservations_url
  end
  
  def adminside_index
    packages = current_admin.packages
    @adminside_reservations = Reservation.where(package_id: packages ).order(id: :desc).page(params[:oage]).per(25)
  end
  
  def adminside_show
   @reservation = Reservation.find(params[:id])

  end
  

  def pay
    require 'payjp'
    @reservation=Reservation.find(params[:id])
    Payjp.api_key = ENV["PAYJP_ACCESS_KEY"] || Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(amount: (@reservation.participants).to_i*(@reservation.package.price).to_i, card: params['payjp-token'],  currency: 'jpy')
    @reservation.update_attributes(paid: true) if @reservation.paid == false
    flash[:notice] ="お支払が完了致しました。"
    redirect_to @reservation
  end
  
  
  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :user_id, :package_id, :participants, :name, :reservation_email, :user_phone, :other_request)
  end 
  
  def back_params
    params.permit(:start_date, :end_date, :user_id, :package_id, :participants, :name, :reservation_email, :user_phone, :other_request)
  end 
  



end
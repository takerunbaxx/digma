class ReservationsController < ApplicationController
  
  
  def index
    require "date"
    @reservations=Reservation.all.order(id: :desc).page(params[:oage]).per(25)
    @past_reservations=Reservation.where("start_date < ?", Date.today)
  end
  
  def new
    @reservation=Reservation.new
    @package=Package.find(params[:package_id])
  end
  
  def show
    @reservation=Reservation.find(params[:id])
  end
  
  
  def create
    package=Package.find(params[:package_id])
    @reservation=package.reservations.build(reservation_params)
    @reservation.user_id=current_user.id
    if @reservation.save!
    flash[:success] = "予約が完了しました"
    redirect_to user_url(current_user.id)
    end
  end
  
  def destroy
    package=Package.find(params[:id])
    current_user.cancel(package)
    flash[:notice] = "予約をキャンセルしました"
    render reservations_path
  end


  #def reserving
    #Payjp.api_key = "秘密鍵"
    #Payjp::Charge.create(
      #amount: 809, # 決済する値段
      #card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      #currency: 'jpy')
  #end
  
  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :user_id, :package_id, :participants, :name, :reservation_email, :user_phone, :other_request)
  end 
  
  
  #ここ以下２行は本来 create action でcontrollerに記載予定だった-------
    #params[:reservation][:start_date] = time_schedule
    #params[:reservation][:end_date] = time_schedule
   #-------------------------------------------------- 
  #def time_schedule
    #require'date'
    ##end_date = params[:reservation][:end_date]
  
    # 年月日別々できたものを結合して新しいDate型変数を作って返す
    #Date.new start_date["start_date(1i)"].to_i,start_date["start_date(2i)"].to_i,start_date["start_date(3i)"].to_i, start_date["start_date(4i)"], start_date["start_date(5i)"]
    #Date.new end_date["end_date(1i)"].to_i, end_date["end_date(2i)"].to_i, end_date["end_date(3i)"].to_i, end_date["end_date(4i)"].to_i, end_date["end_date(5i)"].to_i
  #end


end
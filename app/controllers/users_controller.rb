class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user=User.find(params[:id])
    user_counts(@user)
    #@future_reservation = current_user.reservations.where("start_date > ?", Date.today )
    @future_reservation = current_user.reservations.select(:start_date).where("start_date > ?", Date.today)
  end
  
  def user_about
    @user=User.find(params[:id])
  end
  
  private

    
  

end

class AdminsController < ApplicationController
  
  def index
    @admins=Admin.with_attached_avator.order(id: :desc).page(params[:page]).per(6)
  end

  def show
    @admin=Admin.find(params[:id])
    counts(@admin)
  end
  
  def search_result
      @admins=Admin.search(params[:keyword]).page(params[:page]).per(25)
      @lowest_price=Package.minimum(:price)
  end

end

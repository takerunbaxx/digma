class AdminsController < ApplicationController
    before_action :authenticate_user!, only: [:search_bycategory,:search_index]

  def index
    @admins=Admin.with_attached_avator.order(id: :desc).page(params[:page]).per(6)
  end

  def show
    @admin=Admin.find(params[:id])
    @packages = @admin.packages
    counts(@admin)
    package_counts(@packages)
  end
  
  def search_result
      @admins=Admin.search(params[:keyword]).page(params[:page]).per(25)
  end
  
  def search_bycategory
    @admins_search = Admin.ransack(params[:q])
    @admins_results = @admins_search.result(distinct: true).page(params[:page]).per(25)

     if @admins_results.nil?
     @admin_results = Admin.none
     end
  end
  
  def search_index
     @admins_search = Admin.ransack(params[:q])
    @admins_results = @admins_search.result(distinct: true).page(params[:page]).per(25)

  end

 
 

end

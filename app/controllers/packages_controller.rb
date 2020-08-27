class PackagesController < ApplicationController
  before_action :correct_admin, only: [:destroy]

def packs_index
  @admin = Admin.find(params[:id])
  @packages = @admin.packages.with_attached_images.order(id: :desc).page(params[:page]).per(6)
end
  

def new
  @package=Package.new
  
end

def create
  @package=current_admin.packages.build(package_params)
  if @package.save
      flash[:success]="パッケージ商品を作成しました"
      redirect_to packs_index_admin_url(current_admin.id)
  else
      flash[:secondary]="パッケージ商品を作成しました"
      render :new
  end
end

def show
  @package=Package.find(params[:id])
  if @package.comments.blank?
    @average_score = 0
  else
    @average_score = @package.comments.average(:score).round(2)
  end
  @admin = @package.admin
  @comments = @package.comments.order(id: :desc)
end

def edit
  @package=Package.find(params[:id])
  
end

def update
  @package=Package.find(params[:id])
  if @package.update(package_params)
      flash[:success]="パッケージ商品の編集を完了しました"
      redirect_to packages_url
  end
end

def destroy
  @package.destroy
    flash[:success] = '商品を削除しました。'
    redirect_back(fallback_location: packages_path)
end



private

def package_params
  params.require(:package).permit(:package_name, :price, :package_outline, :package_detail, :package_summary, :user_id, package_images: [],images: [])
end

def correct_admin
    @package = current_admin.packages.find_by(id: params[:id])
    unless @package
      redirect_to root_url
    end
end


end

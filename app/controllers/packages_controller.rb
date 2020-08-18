class PackagesController < ApplicationController
  before_action :correct_admin, only: [:destroy]

def index  
  @packages=Package.with_attached_images.order(id: :desc).page(params[:page]).per(6)
end

def new
  @package=Package.new
  
end

def create
  @package=current_admin.packages.build(package_params)
  if @package.save
      flash[:success]="パッケージ商品を作成しました"
      redirect_to packages_url
  else
      flash[:secondary]="パッケージ商品を作成しました"
      render :new
  end
end

def show
  @package=Package.find(params[:id])
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
  params.require(:package).permit(:package_name, :price, :package_image, :package_outline, :package_detail, :package_summary, :user_id, images: [])
end

def correct_admin
    @package = current_admin.packages.find_by(id: params[:id])
    unless @package
      redirect_to root_url
    end
end
end




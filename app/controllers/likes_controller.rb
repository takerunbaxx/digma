class LikesController < ApplicationController
  
  def index
  end

  
  def create
    @admin=Admin.find(params[:admin_id])
    current_user.like(@admin)
    @admin.create_notification_like!(current_user)
    respond_to do |format|
      format.html {redirect_to likes_list_user_url(current_user.id), flash: {success: '行ってみたい！に追加しました。'} }
      format.js  end
  end

  def destroy
    @admin=Admin.find(params[:admin_id])
    current_user.unlike(@admin)
    respond_to do |format|
      format.html {redirect_to likes_list_user_url(current_user.id), flash: {danger: '行ってみたい！から削除しました。'} }
      format.js  end
  end
end



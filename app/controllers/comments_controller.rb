class CommentsController < ApplicationController
  
def index
end

def new
  @package=Package.find(params[:package_id])
  
end

def create
  package =Package.find(params[:package_id])
  @comment=package.comments.build(comment_params)
  @comment.user_id=current_user.id
  @comment_package = @comment.package
  if @comment.save!
    flash[:success]="コメントと評価をしました"
    redirect_to current_user
  @comment_package.create_notification_comment!(current_user, @comment.id)
  end
end

def destroy
  @comment = Comment.find(params[:id])
  @comment.destroy
  redirect_to package_path(package.id)
end
  
  private
    
def comment_params
    params.permit(:content,:score,:package_id,:user_id)
end


end

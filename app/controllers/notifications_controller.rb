class NotificationsController < ApplicationController
  
  before_action :authenticate_admin!, only: [:index]
  
def index
  @notifications = current_admin.passive_notifications.order(id: :desc).page(params[:page]).per(25)
  @notifications.where(checked: false).each do |notification|
  notification.update_attributes(checked: true)  end
end

def destroy
    @notifications = current_admin.passive_notifications.order(id: :desc).page(params[:page]).per(25)
    @notifications.destroy_all
    redirect_to notifications_url
end

end

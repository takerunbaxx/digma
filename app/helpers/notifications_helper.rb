module NotificationsHelper
  
  
def notification_form(notification)
    @user = notification.user
    @comment = nil
    @user_comment = notification.comment_id
    @user_reservation = notification.reservation_id
    case notification.action
      when "reservation" then 
        @reservation = Reservation.find_by(id: @user_reservation)
        tag.li(@user.username, style: "font-weight: bold;", class: "list-inline-item" )+tag.li("さんが", class: "list-inline-item")+ tag.li(notification.package.package_name, style: "font-weight: bold;", class: "list-inline-item")+tag.li("を予約しました！", class: "list-inline-item")
      when "like" then
        tag.li(@user.username, style: "font-weight: bold;", class: "list-inline-item" )+tag.li("さんが", class: "list-inline-item")+ tag.li(notification.admin.facility_name, style: "font-weight: bold;", class: "list-inline-item")+tag.li("を「行ってみたい！」に登録しました！", class: "list-inline-item")
      when "comment" then
        @comment = Comment.find_by(id: @user_comment)&.content
        tag.li(@user.username, style: "font-weight: bold;", class: "list-inline-item")+ tag.li("さんが", class: "list-inline-item")+tag.li(notification.package.package_name, style: "font-weight: bold;", class: "list-inline-item")+ tag.li("の商品にコメントしました！", class: "list-inline-item")
    end
end

def unchecked_notifications
    @notifications = current_admin.passive_notifications.where(checked: false)
end


end


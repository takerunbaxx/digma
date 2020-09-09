class ApplicationController < ActionController::Base

require 'date'


private

def counts(admin)
  @count_packages = admin.packages.count #作成したパッケージ件数取得
  @count_notifications = admin.passive_notifications.count
  @count_likes = admin.passive_likes.count
end

def package_counts(packages) #予約しているパッケージ件数取得
    packages.each do |package|
    @count_reservation = package.reservations
 end
 if @count_reservation.present?
  @count_reservations = @count_reservation.where("start_date > ?", Date.today).count
 else
     @count_reservations = 0
 end
end


def user_counts(user)
  @count_user = user.reservations.count
end


end


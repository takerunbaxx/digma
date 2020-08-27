class ApplicationController < ActionController::Base

require 'date'


private

def counts(admin)
  @count_packages = admin.packages.count
  @count_notifications = admin.passive_notifications.count
  #@count_reservations = admin.packages.reservations.count
end

def package_counts(packages)
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


class Package < ApplicationRecord
    
  belongs_to :admin
  has_many :reservations, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy


  has_many_attached :images
  has_many_attached :package_images


 def destroy_images
   if self.admin=current_admin
      self.images.purge 
   end
 end
 
def self.thumb_show
  self.images.variant(resize: '350x930').processed
end

def create_notification_comment!(current_user, comment_id)
    temp_ids = Comment.select(:package_id).where(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
    save_notification_comment!(current_user, comment_id, temp_id['package_id']) end
    save_notification_comment!(current_user, comment_id, package_id) if temp_ids.blank?
end

def save_notification_comment!(current_user, comment_id, package_id)
       package=Package.find(package_id)
        notification = current_user.notifications.new(
          package_id: id,
          comment_id: comment_id,
          admin_id: package.admin_id,
          action: 'comment')
        notification.save if notification.valid?
end

  def create_notification_reservation!(current_user)
     temp = Notification.where(["user_id = ? and package_id = ? and admin_id = ? and action = ? ", current_user.id, id, admin_id,'reservation'])
    if temp.blank?
      package = Package.find(id)
      notification = current_user.notifications.new(
        package_id: id,
        admin_id: package.admin.id,
        action: 'reservation'
      )
      notification.save if notification.valid?
    end
  end


end

class Package < ApplicationRecord
    
  belongs_to :admin
  has_many :reservations, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many_attached :images


 def destroy_images
   if self.admin=current_admin
      self.images.purge 
   end
 end
 
def self.thumb_show
  self.images.variant(resize: '350x930').processed
end

end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         #:confirmable, :lockable, :timeoutable #, :omniauthable, omniauth_providers: [:twitter]

  has_many :likes, dependent: :destroy
  has_many :likings, through: :likes, source: :admin
  has_many :reservations, dependent: :destroy
  has_many :cards
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  
 def cancel(package)
    complete_reservation=self.reservations.find_by(user_id: package.id)
    complete_reservation.destroy if complete_reservation
 end
 
 def like(admin)
   self.likes.find_or_create_by(admin_id: admin.id)
 end
 
 def unlike(admin)
   has_already_liked = self.likes.find_by(admin_id: admin.id)
   has_already_liked.destroy if has_already_liked
 end
 
 def liking?(admin)
     self.likings.include?(admin)
 end


end

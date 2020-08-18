class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         #:confirmable, :lockable, :timeoutable #, :omniauthable, omniauth_providers: [:twitter]
         
  has_many :events, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :cards
  has_many :comments, dependent: :destroy
  
  
 def cancel(package)
    complete_reservation=self.reservations.find_by(user_id: package.id)
    complete_reservation.destroy if complete_reservation
 end

end
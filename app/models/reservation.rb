class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :package
  
  with_options presence: true do
    validates :start_date
    validates :end_date
    validates :name
    validates :participants
    validates :other_request
    validates :user_phone
    validates :reservation_email
  end
end

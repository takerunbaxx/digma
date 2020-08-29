class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #belongs_to :location, dependent: :destroy
  has_many :packages, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", dependent: :destroy
  has_one_attached :avator
  
  with_options presence: true do
  validates :avator
  validates :admins_name
  validates :introduction1
  validates :introduction2
  validates :facility_name
  validates :homeadress
  validates :open
  validates :close
  end
  
  def self.search(keyword)
      if keyword
        Admin.where(["prefecture_name LIKE?", "%#{keyword}%" ]).or(Admin.where(['cityname LIKE (?)',"%#{keyword}%"]))
      else
        flash[:info]="該当する項目は見つかりませんでした。"
        Admin.all
      end
      
  end
  
  def create_notification_like!(current_user)
    temp = Notification.where(["user_id = ? and admin_id = ? and action = ? ", current_user.id, id, 'like'])
    if temp.blank?
      notification = current_user.notifications.new(
        admin_id: id,
        action: 'like'
      )
      notification.save if notification.valid?
    end
  end
  

end

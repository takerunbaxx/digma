class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  #belongs_to :location, dependent: :destroy
  has_many :packages, dependent: :destroy
  has_one_attached :avator
  
  def self.search(keyword)
      if keyword
        Admin.where(["prefecture_name LIKE?", "%#{keyword}%" ]).or(Admin.where(['cityname LIKE (?)',"%#{keyword}%"]))
      else
        flash[:info]="該当する項目は見つかりませんでした。"
        Admin.all
      end
      
  end

end

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :package
  
  validates :content, presence: true
  validates :score, numericality: { less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }, presence: true
  
end

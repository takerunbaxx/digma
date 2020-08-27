class Notification < ApplicationRecord
  
  default_scope->{order(created_at: :desc)}
  
  belongs_to :user, optional: true
  belongs_to :admin, optional: true
  belongs_to :package, optional: true
  belongs_to :comment, optional: true
end

class Event < ApplicationRecord
    
    belongs_to :admin
    
    validates :note, presence: true
    validates :note_content, presence: true
end

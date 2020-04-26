class Tweet < ApplicationRecord
    has_many :likes,dependent: :destroy
    belongs_to :user, optional: true
    validates :content, presence: true
    has_many :tweets, dependent: :destroy
    
    
end

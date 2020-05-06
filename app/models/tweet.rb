class Tweet < ApplicationRecord
    has_many :likes,dependent: :destroy
    belongs_to :user, optional: true
    validates :content, presence: true
    has_many :tweets, dependent: :destroy
    has_and_belongs_to_many :tags
    
    scope :content, -> (content) { where("content LIKE ?", "%#{content}%") }
     
    after_create do
        tweet = Tweet.find_by(id: self.id)
        hashtags = self.content.scan(/#\w+/)
        hashtags.uniq.map do |hashtag|
        tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
        tweet.tags << tag

        end
    end

    before_update do
        tweet = Tweet.find_by(id: self.id)
        tweet.tags.clear
        hashtags = self.content.scan(/#\w+/)
        hashtags.uniq.map do |hashtag|
        tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
        tweet.tags << tag

        end
    end
end

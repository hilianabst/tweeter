class CreateTagsTweets < ActiveRecord::Migration[5.2]
  # def change
  #   create_table :tags_tweets do |t|
  #   end
  # end

  def self.up
    create_table :tags_tweets, id: false do |t|
      t.references :tag, null: false
      t.references :tweet, null: false
    end

    # Add an unique index for better join speed!
    add_index(:tags_tweets, [:tag_id, :tweet_id], :unique => true)
  end

  def self.down
    drop_table :tags_tweets
  end


end

class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :reposts, class_name: "Post", foreign_key: "post_id", dependent: :destroy
  belongs_to :original_post, class_name: "Post", foreign_key: "post_id", optional: true
  
  
  validates :content, presence: :true
  
end

# rails g migration AddRetweetsToTweets tweet:references

# belongs_to :original_tweet, class_name: "Tweet", foregin_key: "tweet_id", optional: true
# has_many :retweets, class_name: "Tweet", foreign_key: "tweet_id", dependent: :destroy
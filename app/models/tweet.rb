class Tweet < ActiveRecord::Base


  # this is for user input validation
  attr_accessible(:twitter_user, :tweeted_text, :tweeted_at)

  validates(:twitter_user, presence: true)
  validates(:tweeted_text, presence: true)
  validates(:tweeted_at,   presence: true)
  belongs_to(:user)
end

class Tweet < ActiveRecord::Base


  # this is for user input validation
  attr_accessible(:twitter_user, :tweeted_text, :tweeted_at)

  validates(:twitter_user, presence: true)
  validates(:tweeted_text, presence: true)
  validates(:tweeted_at,   presence: true)
  belongs_to(:user)
  has_and_belongs_to_many(:categories)

  def suggested_categories
    text = tweeted_text.downcase.gsub(/\d/, '').split(/\s+/).sort
    title = Category.all.map(&:title).map(&:downcase)
    (text & title).map(&:capitalize).join(', ')
  end
end

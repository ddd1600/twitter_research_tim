class Tweet < ActiveRecord::Base


  # this is for user input validation
  attr_accessible(:twitter_user, :tweeted_text, :tweeted_at)

  validates(:twitter_user, presence: true)
  validates(:tweeted_text, presence: true)
  validates(:tweeted_at,   presence: true)
  belongs_to(:user)
  has_and_belongs_to_many(:categories)

  def suggested_categories
    text = tweeted_text.gsub(/#/, '')
    r = text.downcase.split.sort

    titles = Category.all.map(&:title).map(&:downcase)

    s = r & titles
    s.sort.join(', ')
  end
end

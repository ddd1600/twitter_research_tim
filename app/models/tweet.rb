class Tweet < ActiveRecord::Base


  # this is for user input validation
  attr_accessible(:twitter_user, :tweeted_text, :tweeted_at, :categories_as_string)

  validates(:twitter_user, presence: true)
  validates(:tweeted_text, presence: true)
  validates(:tweeted_at,   presence: true)

  scope :with_notes, includes(:notes).order('notes.created_at desc')

  belongs_to(:user)
  has_and_belongs_to_many(:categories)
  has_many :notes

  def suggested_categories
    text = tweeted_text.downcase.gsub(/\d/, '').split(/\s+/).sort
    title = Category.all.map(&:title).map(&:downcase)
    (text & title).map(&:capitalize).join(', ')
  end

  # Returns a comma separated string of the current category titles
  def categories_as_string
    categories.map(&:title).sort.join(', ')
  end

  #Given a comma separated string of category titles, reset the
  #categories for this tweet tot he categories in the string
  def categories_as_string= (new_categories)
    categories.clear

    new_categories.split(/\s*, \s*/).each do |title|
      cat = Category.with_title(title).first
      # if cat not equal to nil is what the below code says
      categories << cat if cat # could also be followed by !cat.nil?
    end
  end
end

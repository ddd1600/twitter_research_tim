class Category < ActiveRecord::Base
  # scope(:with_title, lambda {|t| where('LOWER(title) = ', t.downcase)
  attr_accessible(:title)
  validates(:title, presence: true, uniqueness: true)
  has_and_belongs_to_many(:tweets)

  def self.with_title (title)
    where('LOWER(title)=?', title.downcase)
  end

  def title_match? (other)
    title.downcase == other.downcase
  end
end

require 'test_helper'

class TweetTest < ActiveSupport::TestCase

  setup do
    %w(Business Politics Religion Science Love).each do |title|
      Category.create!(title: title)
    end
  end

  test("suggested categories works correctly") do
    tweet = Tweet.new do |t|
      t.tweeted_text = "Business politics is an instance of the class politics #religion"
    end
assert_equal("Business, Politics, Religion", tweet.suggested_categories)
  end

end

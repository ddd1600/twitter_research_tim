require 'test_helper'

class TweetTest < ActiveSupport::TestCase

  setup do
    %w(Business Politics Religion Science Love).each do |title|
      Category.create!(title: title)
    end
  end

  test("suggested categories works correctly") do
    tweet = Tweet.new do |t|
      t.tweeted_text = "Politics and Business are instances of the
      class religion #politics #religion #business? .  !%&"
    end
    assert_equal("Business, Politics, Religion", tweet.suggested_categories)
  end

  test("a blank string is returned when there are no matches") do
    tweet = Tweet.new(tweeted_text: "no matching category name")
    assert_equal("", tweet.suggested_categories)
  end
end

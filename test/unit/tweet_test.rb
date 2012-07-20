require 'test_helper'

class TweetTest < ActiveSupport::TestCase

  setup do
    %w(Business Politics Religion Science Love).each do |title|
      Category.create!(title: title)
    end
  end

  test("suggested categories works correctly") do
    tweet = Tweet.new do |t|
      t.tweeted_text = "Politics and 2012Business are instances of the
      class religion #politics #religion 2#business? .  !%&"
    end
    assert_equal("Business, Politics, Religion", tweet.suggested_categories)
  end

  test("a blank string is returned when there are no matches") do
    tweet = Tweet.new(tweeted_text: "no matching category name")
    assert_equal("", tweet.suggested_categories)
  end

    def test_settings_categories_from_a_string
      tweet = Tweet.new
      cat = Category.where(title: "Business").first
      assert(cat)

      tweet.categories << cat
      assert_equal(1, tweet.categories.size)

      tweet.categories_as_string = "Love, Religion"
      assert_equal(2, tweet.categories.size)
      assert_equal(%w(Love Religion),
                   tweet.categories.map(&:title).sort)
    end


end

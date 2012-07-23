class TweetsController < ApplicationController
  respond_to(:html, :json)

  def index
    @tweets = current_user.tweets.order('tweeted_at desc').limit(25)
  end

  def create
    @tweet = current_user.tweets.create(params[:tweet])
    respond_with(@tweet)
  end
end

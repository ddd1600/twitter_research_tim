class TweetsController < ApplicationController
  respond_to(:html, :json)

  def index
    @tweets = current_user.tweets.order('tweeted_at desc').limit(25)
    respond_with(@tweets)
  end

	def edit
		@tweet = current_user.tweets.find(params[:id])
		respond_with @tweet
	end

#PROBLEM IS HERE
	def update
		@tweet = Category.find(params[:id])
		@category.update_attributes(params[:tweet])
		respond_with @tweets
	end
#THE PROBLEM STOPS HERE

  def create
    @tweet = current_user.tweets.create(params[:tweet])
    respond_with(@tweet, :location => tweet_url(@tweet))
  end

  def show
    @tweet = current_user.tweets.with_notes.find(params[:id])
    respond_with(@tweet)
  end

end

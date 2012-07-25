class NotesController < ApplicationController

#  METHODS BROUGHT TO ATTENTION
#  nested.build
#	 .create
#  .update_attributes
#  .destroy

before_filter :fetch_tweet
before_filter :fetch_note, :except => [:index, :new, :create]

	def index
		@notes = @tweet.notes.order('created_at desc')
		respond_with([@tweet, @notes], location: tweet_url(@tweet))
		#this local bit allows us to not have to redirect to a page that shows only notes
	end

	def show
		respond_with([@tweet, @note], location: tweet_url(@tweet))
	end

	def new
		@note = @tweet.notes.build
		respond_with([@tweet, @note])#, location: tweet_url(@tweet)
	end

	def create
		@note = @tweet.notes.create(params[:note])
		respond_with([@tweet, @note], location: tweet_url(@tweet))
	end

	def edit
		respond_with([@tweet, @note])
	end

	def update
		@note.update_attributes(params[:note])
		respond_with([@tweet, @note])
	end

	def destroy
		@note.destroy
		respond_with([@tweet, @note]) #rails will detect that 'this note' no longer exists and will redirect to the
	end

	#every action that gets called in here will have a tweet_id, so we're going to dry up our code in anticipation that things are going to get messy
	private
	def fetch_tweet
		@tweet = current_user.tweets.find(params[:tweet_id])
		#@note = @tweet.notes.find(params[:id]) if params[:id]
		#removes ordering dependency when it comes to the before_filters
	end

	def fetch_note
		@note = @tweet.notes.find(params[:id])
	end

end

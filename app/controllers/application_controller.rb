class ApplicationController < ActionController::Base
  protect_from_forgery
  resoind_to(:html, :json)
  before_filter(:authenticate_user!)
end

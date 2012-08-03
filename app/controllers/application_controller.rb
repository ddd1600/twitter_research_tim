class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to(:html, :json, :xml, :js)
  before_filter(:authenticate_user!)
end

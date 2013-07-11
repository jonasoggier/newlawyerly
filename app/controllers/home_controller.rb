class HomeController < ApplicationController

	skip_before_filter :require_login  

	def index
      @feed_items = current_user.feed.page params[:page] 
	end
	
end
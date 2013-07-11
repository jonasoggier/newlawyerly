class HomeController < ApplicationController

	skip_before_filter :require_login  # TBD if sufficient from security perspective!

	def index
		if logged_in?
      @feed_items = current_user.feed.page params[:page] 
  		@users = User.all  # this is for the temporary list of users on homepage
  	end
	end
	
end
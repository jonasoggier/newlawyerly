class HomeController < ApplicationController

	skip_before_filter :require_login  

	def index
      @posts = Post.last(15).reverse
      @user = User.new # needed for Sign-up
      @example_users = User.offset(rand(User.count)).limit(6).where.not(profile_picture: nil) # needed for sign-up modal
	end
	
end
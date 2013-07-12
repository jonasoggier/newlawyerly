class HomeController < ApplicationController

	skip_before_filter :require_login  

	def index
      @posts = Post.last(15).reverse
	end
	
end


class NotificationsController < ApplicationController

  def destroy
    @notification = Notification.find(params[:id])

    if @notification.follower_id != nil
    	@user = User.find(@notification.follower_id)  # needed for redirect
   		@notification.destroy
			redirect_to @user
    else
     	@post = Post.find(@notification.post_id) # needed for redirect
			@notification.destroy
    	redirect_to user_post_path(current_user, @post)
    end
    
  end
end

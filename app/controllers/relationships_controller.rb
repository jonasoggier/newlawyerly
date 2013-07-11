class RelationshipsController < ApplicationController
  
  def create
  	@relationship = current_user.relationships.build(:followed_user_id => params[:followed_user_id])
	  @relationship.save

    check = Notification.where("user_id = #{@relationship.followed_user_id} AND follower_id = #{@relationship.user_id}") 
    if check.empty?
      Notification.create(:user_id => @relationship.followed_user_id, :follower_id => @relationship.user_id)
    end

    # The next two lines are exclusively needed for the followers counter on the users' show page
    id = params[:id] ? params[:id] : params[:followed_user_id] # this accounts for the first load and the subsequent Ajax requests
    @user = User.where(:id => id).first
	  respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
	end

  def destroy
	  @relationship = current_user.relationships.find(params[:id])
    @user = @relationship.followed_user
	  @relationship.destroy

	  respond_to do |format|
      format.html { redirect_to current_user }
      format.js
    end
	end
end

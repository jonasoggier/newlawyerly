module RelationshipsHelper

	def following_helper_1?
		true if current_user.relationships.where(:followed_user_id => params[:id]).count == 1 # checks whether there is a relationship
	end

	def unfollow_path
		id = params[:id] ? params[:id] : params[:followed_user_id] # this accounts for the first load and the subsequent Ajax requests
		current_user.relationships.where(:followed_user_id => id).first # returns followed_user instance / there is always only one in the DB (thus first is okay)
	end

	def following_helper_2?(user)
		true if current_user.relationships.where(:followed_user_id => user.id).count == 1 # checks whether there is a relationship
	end

end

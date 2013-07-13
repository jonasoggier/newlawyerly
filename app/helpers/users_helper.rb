module UsersHelper

	def name(post)
    	"#{post.user.first_name} #{post.user.last_name}"
	end

	def user_name(user)
    	"#{user.first_name} #{user.last_name}"
	end

end
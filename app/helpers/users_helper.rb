module UsersHelper

	def name(post)
    "#{post.user.first_name} #{post.user.last_name}"
	end

end
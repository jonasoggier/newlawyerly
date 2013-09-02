module UsersHelper

	def name(post)
		if post.user.company_account
			"#{post.user.company}"
		else
			"#{post.user.first_name} #{post.user.last_name}"
		end
	end

	def user_name(user)
		if user.company_account
			"#{user.company}"
		else
			"#{user.first_name} #{user.last_name}"
		end
	end

end
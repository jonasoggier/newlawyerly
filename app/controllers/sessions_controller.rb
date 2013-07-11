class SessionsController < ApplicationController

  skip_before_filter :require_login, :only => [:create]

  def create
		@user = login(params[:email], params[:password])
		if @user
			redirect_to root_path
		else
			redirect_to :root, :alert => "Invalid credentials. Please try again!"
		end
  end

  def destroy
		logout
		redirect_to :root, notice: "Bye... Hope to see you later!"
  end

end
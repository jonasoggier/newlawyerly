class ApplicationController < ActionController::Base
  protect_from_forgery

  	before_filter :require_login

	protected

	def not_authenticated
	  redirect_to root_path, :alert => "Bitte melden Sie sich zuerst an, um diese Funktion nützen zu können."
	end

end
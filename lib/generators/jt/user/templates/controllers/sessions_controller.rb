class SessionsController < ApplicationController

	before_action :require_no_user, except: [:destroy]
	
	def new
	end

	def create
		user = User.authenticate(params[:email], params[:password])

		if user
			set_current_user(user)
			redirect_to root_url
		else
			render :new
		end
	end
	
	def destroy
		reset_session
		redirect_to root_url
	end	

end

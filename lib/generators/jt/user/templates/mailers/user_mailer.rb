class UserMailer < ActionMailer::Base

	def reset_password(user_id)
		@user = User.find(user_id)
		mail(to: @user.email, subject: 'Reset password')
	end

end

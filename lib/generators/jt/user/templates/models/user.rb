class User < ActiveRecord::Base

	include JT::User::Authentication

end

module UserAuthentication
	extend ActiveSupport::Concern

	included do

		has_secure_password

		tokenize :password_token

		validates :email, presence: true, email_format: true, uniqueness: { case_sensitive: false }
		
		before_save :downcase_email

		scope :search_by_email_for_authentication, ->(email = nil) { where(email: email.to_s.downcase).where('password_digest IS NOT NULL') }

	end

	class_methods do

		def authenticate(email, password)
			self.search_by_email_for_authentication(email).first.try(:authenticate, password)
		end

	end

	def downcase_email
		self.email.downcase! if self.email
	end

	def increment_login_stats!(remote_ip)
		attributes = {
			last_login_at: Time.now,
			last_login_remote_ip: remote_ip,
			login_count: (self.login_count || 0) + 1
		}

		self.update_columns(attributes)
	end

end

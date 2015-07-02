module UserAuthentication
	extend ActiveSupport::Concern

	included do

		has_secure_password(validations: false)

		validates :email, presence: true, email_format: true, uniqueness: { case_sensitive: false}
		validates :password_token, uniqueness: true, if: Proc.new {|u| !u.password_token.blank? }
		
		before_save :downcase_email

		scope :search_by_email_for_authentication, ->(email = nil) { where(email: email.to_s.downcase).where('password_digest IS NOT NULL') }

	end

	module ClassMethods

		def authenticate(email, password)
			self.search_by_email_for_authentication(email).first.try(:authenticate, password)
		end

	end

	def downcase_email
		self.email.downcase! if self.email
	end

	def generate_new_password_token!
		self.password_token = loop do
			random_token = SecureRandom.urlsafe_base64(128, false)
			break random_token unless self.class.exists?(password_token: random_token)
		end
		self.save!
	end

	def clear_password_token!
		self.update_column(:password_token, nil)
	end

end

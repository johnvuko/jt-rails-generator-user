module Jt
	class UserGenerator < Rails::Generators::Base

		source_root File.expand_path("../templates", __FILE__)

		def create_initializer_file
			generate "migration", "CreateUsers", "email:string password_digest:string password_token:string last_login_at:datetime last_login_remote_ip:string login_count:integer"

			directory 'controllers', 'app/controllers'
			directory 'mailers', 'app/mailers'
			directory 'models', 'app/models'
			directory 'views', 'app/views'

			route "resources :users, only: [:new, :create] do
  collection do
    get 'password_forgot' => 'users#password_forgot', as: :password_forgot
    post 'password_forgot' => 'users#password_forgot'

    get 'reset_password/:token' => 'users#reset_password', as: :reset_password
  end
end"

			route "get 'logout' => 'sessions#destroy', as: :logout"
			route "post 'login' => 'sessions#create'"
			route "get 'login' => 'sessions#new', as: :login"
		end
	end
end

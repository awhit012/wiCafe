enable :sessions

helpers do

	def start_session user
		session[:id] = user.id
		current_user
	end

	def current_user
			@current_user ||= User.find_by_id(session[:id])
	end

	def logged_in?
		begin
			return current_user if current_user.oauth_secret == session[:oauth_secret]
		rescue
			false
		end
	end

	def log_out
		session.clear # [:user_id] = nil
	end

	def authenticate? username, password
		user = User.find_by_username(username)
		user.password == password ? user : false
	end
end

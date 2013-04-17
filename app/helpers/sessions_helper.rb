module SessionsHelper

	def sign_in(user)
		session[:user_id] = user.id 
		self.current_user = user
	end

	#setter method
	def current_user=(user)
		@current_user = user 
	end

	#getter method
	def current_user
		#conditional set @current_user to instance of session user_id
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def sign_in?
		!current_user.nil?
	end

	def sign_out
		session[:user_id] = nil
		self.current_user = nil
	end

	def current_user?(user)
		user == current_user
	end

	def deny_access
		redirect_to signin_path, :notice => "Please signin to access this page."
	end

end

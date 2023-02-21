class CookieshowController < ApplicationController
	before_action :require_login
	
	def info
		cookies[:my_test_value] = 'test'
		cookies[:my_another_value] = 'another'
		@cookie = cookies
		@session = session
		render 'info'
	end

	private
    
    def require_login
      if current_user.nil?
        redirect_to new_user_session_path, notice: "You need to be logged in"
      end
    end
end

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
        #flash[:error] = "You must be logged in to access this section"
        redirect_to new_user_session_path # halts request cycle
      end
    end
end

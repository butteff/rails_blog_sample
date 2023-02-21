class PostController < ApplicationController
	before_action :require_login

	def create
		@board = Board.find(params[:format])
		@post = @board.posts.create(post_params)
		redirect_to board_url(@board)
	end
	
	private 
		def post_params
			params.require(:post).permit(:body, :image)
		end
		def require_login
	      if current_user.nil?
	        redirect_to new_user_session_path, notice: "You need to be logged in"
	      end
	    end
end

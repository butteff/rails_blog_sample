class CommentsController < ApplicationController
	#http_basic_authenticate_with name: "lol", password: "test", only: [:destroy]
	before_action :require_login, only: [:destroy]
	def index
		@comments = Comment.all
	end

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(comment_params) #because of has_many\belogns_to
		
		#I can use ActiveRecord in different ways
		#my active record directly comment input for a test:
		
		#comment = Comment.create(commenter: comment_params[:commenter], body: comment_params[:body], article_id: params[:article_id], status: comment_params[:status])

		#another my active record test:
		#comment = Comment.new
		#comment.commenter = comment_params[:commenter]
		#comment.body = comment_params[:body]
		#comment.article_id = params[:article_id]
		#comment.status = comment_params[:status]
		#comment.save

		redirect_to article_path(@article)
	end

	def destroy
    	@article = Article.find(params[:article_id])
    	@comment = @article.comments.find(params[:id])
    	@comment.destroy
    	redirect_to article_path(@article), status: :see_other #303
  	end

	private
		def comment_params
			params.require(:comment).permit(:body,:commenter, :status)
		end

	private
	    def require_login
	      if current_user.nil?
	        redirect_to new_user_session_path, notice: "You need to be logged in"
	      end
	    end
end

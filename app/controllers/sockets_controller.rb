class SocketsController < ApplicationController
	before_action :require_login

	def chat
		username = current_user.email.gsub(/@.*/, '')
		message = '@'+username+' is connected to the chat'.to_s
		username = '@chat_info'
		send_message(username, message)
	end

	def post
		message = chat_params
		username = '@'+current_user.email.gsub(/@.*/, '').to_s
		send_message(username, message)
	end

	private
		def require_login
	      if current_user.nil?
	        redirect_to new_user_session_path, notice: "You need to be logged in"
	      end
	    end

	    def chat_params
	      params.require(:chat_message)
	    end

	    def send_message(username, message)
	    	ActionCable.server.broadcast("chat_test", { username: username, body: message })
	    end
end

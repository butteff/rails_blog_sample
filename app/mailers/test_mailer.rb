class TestMailer < ApplicationMailer

	default from: 'test@example.com'

  	def test_email
  		@message = params[:message]
    	@mail_variable = 'test value'
    	mail(to: 'butteff@yandex.ru', subject: 'Ruby mailer test')
  	end

end
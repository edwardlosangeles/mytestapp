class UserMailer < ApplicationMailer

	default from: "edwardlosangeles@gmail.com"

	def contact_form(email, name, message)
		@message = message
		mail(from: email,
			to: 'edwardlosangeles@gmail.com',
			subject: "A new contact form message from #{name}")
	end

	def welcome(user)
		@appname = "epictestapp.herokuapp.com"
		mail(to: user.email,
			subject: "Welcome to #{@appname}!")
	end

end

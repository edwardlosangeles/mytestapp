class UserMailer < ApplicationMailer

	default from: "edwardlosangeles@gmail.com"

	def contact_form(email, name, message)
		@message = message
		mail(from: email,
			to: 'edwardlosangeles@gmail.com',
			subject: "A new contact form message from #{name}")
	end



end

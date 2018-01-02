class UserMailerPreview < ActionMailer::Preview


	#can be viewed here: http://localhost:3000/rails/mailers/user_mailer/contactform
	def contactform
		emailname = "Edward"
		emailaddress = "edward@example.com"
		emailmessage = "Hey there!"
		UserMailer.contact_form(emailaddress, emailname, emailmessage)
	end

end
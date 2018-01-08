# RSpec install
# moved to spec folder from test folder

class UserMailerPreview < ActionMailer::Preview

	def contactform
		emailname = "Edward"
		emailaddress = "edward@example.com"
		emailmessage = "Hey there!"
		UserMailer.contact_form(emailaddress, emailname, emailmessage)
	end

	def welcome
		emailto = User.last
		UserMailer.welcome(emailto)
	end

end
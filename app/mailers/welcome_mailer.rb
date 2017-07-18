class WelcomeMailer < ApplicationMailer

	def welcome_send(user)
		@user = user
		mail to:user.email, subject: "Welcome to DermaStore", from: 'admin@DermaStore.com'
	end
end
class WelcomeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.mailer.subject
  #
 

	def welcome_send(user)
		@user = user
		mail to:user.email, subject: "Welcome to DermaStore", from: 'admin@DermaStore.com'
	end

  def mailer
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end

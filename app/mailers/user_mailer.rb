class UserMailer < ApplicationMailer
  default from: "admin@dermastore.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'quynhyen.vothi@gmail.com',
        :subject => "A new contact form message from #{name}")
  end
  def welcome(user)
  @appname = "Dermastore"
  mail( :to => user.email,
        :subject => "Welcome to #{@appname}!")
  end
end
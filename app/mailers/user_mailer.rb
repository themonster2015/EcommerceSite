class UserMailer < ApplicationMailer
  default from: "from@example.com"
  layout "mailer"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'quynhyen.vothi@gmail.com',
        :subject => "A new contact form message from #{name}")
  end
  def welcome(user)
  @appname = "DermaShop"
  mail( :to => user.email,
        :subject => "Welcome to #{@appname}!")
  end
  def paid_success(user, product)
    @user = user
   	@product = product
   	mail( :from => 'admin@DermaShop.com',
         :to => user.email,
         :subject => "Confirmation of Order and Payment from DermaShop")
  end
end
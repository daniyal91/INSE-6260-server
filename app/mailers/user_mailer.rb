class UserMailer < ApplicationMailer
	default from: 'admin@chss.com'
 
  def register_email(user)
    @user = user
    @url  = 'http://localhost:3000/users'
    mail(to: @user.email, subject: 'Welcome to CHSS')
  end
end

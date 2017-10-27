class UserMailer < ApplicationMailer
  default from: "everybody@appacademy.io"

  def welcome_email(user)
    @user = user
    @url  = 'localhost:3000/users/activate?activation_token=' + user.activation_token
    mail(to: user.email, subject: 'get the jams; activate')
  end

end

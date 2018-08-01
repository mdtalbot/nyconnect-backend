class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @specialtext = `Hello, #{user}, welcome to PolitiConnect!`
    mail(to: `#{user.email}`, subject: "Welcome to PolitiConnect")
  end

  def rep_email(user)
    @user = user

end

class RepMailerController < ApplicationController

  def rep_mailer
    UserMailer.rep_email(User.first).deliver_now

    render json: {
        username: User.first.username,
        id: User.first.id,
        email: User.first.email,
        token: get_token(payload(User.first.username, User.first.email, User.first.id))
      }
  end

end


class UsersController < ApplicationController
  before_action :requires_login, only: [:index, :show, :users_snacks]
  before_action :is_admin, only: [:index]

  def index
    render json: User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    render json: @user
  end

  def create
    @user = User.new

    @user.username = params[:username]
    @user.password = params[:password]
    @user.email = params[:email]

    if (@user.save)
      UserMailer.welcome_email(@user).deliver_now
      render json: {
        username: @user.username,
        id: @user.id,
        email: @user.email,
        token: get_token(payload(@user.username, @user.email, @user.id))
      }
    else
      render json: {
        errors: @user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  def users_rep_mail
    @user = User.find_by(id: params[:user_id])

    render json: @user.rep_mail
  end
end




class ApplicationController < ActionController::API
  # Defined in our .env file.
  def secret_key
    ENV['SECRET_KEY']
  end

  def payload(username, id, email)
    { username: username, id: id, email: email}
  end

  def get_token(payload)
    JWT.encode payload, secret_key(), 'HS256'
  end

  def authorization_token
    request.headers["Authorization"]
  end

  def decoded_token
    begin
      JWT.decode authorization_token(), secret_key(), true, { algorithm: 'HS256' }
    rescue JWT::VerificationError, JWT::DecodeError
      nil
    end
  end

  def valid_token?
    !!decoded_token
  end


  def requires_login
    if !valid_token?
      render json: {
        message: 'You wrong!'
      }, status: :unauthorized
    end
  end

  def is_admin
    decoded_token[0]["id"] < 10
  end
end


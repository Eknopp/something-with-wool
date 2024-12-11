class ApplicationController < ActionController::API
#   include Authentication
  before_action :authorized

  def encode_token(payload)
    # TODO: save secret_key instead of tempkey
      JWT.encode(payload, 'tempkey') 
  end

  def decoded_token
      header = request.headers['Authorization']
      if header
          token = header.split(" ")[1]
          begin
              JWT.decode(token, 'tempkey', true, algorithm: 'HS256')
          rescue JWT::DecodeError
              nil
          end
      end
  end

  def current_user 
      if decoded_token
          user_id = decoded_token[0]['user_id']
          @user = User.find_by(id: user_id)
      end
  end

  def authorized
      unless !!current_user
      render json: { message: 'Please log in' }, status: :unauthorized
      end
  end
end

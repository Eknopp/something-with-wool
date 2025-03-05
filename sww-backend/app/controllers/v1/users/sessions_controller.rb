class V1::Users::SessionsController < Devise::SessionsController
  include ActionController::Cookies
  skip_before_action :authenticate_user!, only: [:create]
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    refresh_token = generate_refresh_token(resource)
    resource.update(refresh_token: refresh_token)
    cookies.signed[:refresh_token] = {value: refresh_token, httponly: true, expires: 1.month.from_now, secure: true}

    render json: {
      status: {code: 200, message: "Logged in successfully."},
      data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
    }, status: :ok
  end

  def respond_to_on_destroy
    authenticate_user!
    if current_user
      current_user.update(refresh_token: nil)
      cookies.delete(:refresh_token)
      render json: {
        status: 200,
        message: "Logged out successfully"
      }, status: :ok
    end
  end
end

def generate_refresh_token(resource)
  exp = 1.month.from_now.to_i
  refresh_token_secret_key = SecretKeysConfiguration::REFRESH_TOKEN_SECRET
  JWT.encode({user_id: resource.id, exp: exp}, refresh_token_secret_key)
end

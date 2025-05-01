class V1::Users::SessionsController < Devise::SessionsController
  include ActionController::Cookies

  # Hiding linter, create is being used behind the scenes by devise
  # rubocop:disable LexicallyScopedActionFilter
  skip_before_action :authenticate_user!, only: [:create]
  # rubocop:enable LexicallyScopedActionFilter
  respond_to :json

  private

  # On login
  def respond_with(resource, _opts = {})
    generate_and_set_tokens(resource)

    render json: {
      status: {code: 200, message: "Logged in successfully."},
      data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
    }, status: :ok
  end

  # On logout
  def respond_to_on_destroy
    authenticate_user!
    if current_user
      current_user.update(refresh_token: nil)
      cookies.delete(:refresh_token)
      cookies.delete(:access_token)
      render json: {
        status: 200,
        message: "Logged out successfully"
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "User not logged in"
      }, status: :unauthorized
    end
  end
end

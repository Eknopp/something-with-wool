class ApplicationController < ActionController::API
  before_action :authenticate_user!

  private

  def jwt_encode
    SecretKeysConfiguration::ACCESS_TOKEN_SECRET
  end

  def authenticate_user!
    if cookies[:access_token].present?
      super
    elsif cookies.signed[:refresh_token].present?
      user = User.find_by(refresh_token: cookies.signed[:refresh_token])
      if user&.refresh_token_valid?
        sign_in(user)
        update_refresh_token(user)
      else
        render_unauthorized("Couldn't find user or an active refresh token.")
      end
    else
      render_unauthorized("Couldn't find an active session.")
    end
  end

  def update_refresh_token(user)
    return unless user
    exp = 1.month.from_now.to_i
    refresh_token_secret_key = SecretKeysConfiguration::REFRESH_TOKEN_SECRET
    new_refresh_token = JWT.encode({user_id: user.id, exp: exp}, refresh_token_secret_key)
    user.update(refresh_token: new_refresh_token)
    cookies.signed[:refresh_token] = {value: new_refresh_token, httponly: true, expires: 1.month.from_now}
  end

  def render_unauthorized(message)
    render json: {status: 401, message: message}, status: :unauthorized
  end

  private def render_success(message, status_data, data)
    body = {
      status_kind: "success",
      status_message: "#{controller_name}.#{message}",
      status_data: status_data,
      data: data
    }

    render json: body, status: :ok, serialize: false
  end

  private def render_error(error)
    Rails.logger.error(error.message)
    Rails.logger.error(error.backtrace.join("\n"))
    render_unprocessable_entity("general.error", error.message)
  end
end

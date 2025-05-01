class ApplicationController < ActionController::API
  include ActionView::Helpers::TranslationHelper
  include TokenResponse

  before_action :authenticate_user!

  private

  def jwt_encode
    SecretKeysConfiguration::ACCESS_TOKEN_SECRET
  end

  def authenticate_user!
    if cookies[:access_token].present?
      begin
        access_token_secret_key = SecretKeysConfiguration::ACCESS_TOKEN_SECRET
        decoded_token = JWT.decode(cookies[:access_token], access_token_secret_key).first
        @current_user = User.find_by(id: decoded_token["user_id"])

        if @current_user.nil?
          render_unauthorized("Invalid access token.")
        end
      rescue JWT::ExpiredSignature
        render_unauthorized("Access token has expired.")
      rescue JWT::DecodeError
        render_unauthorized("Invalid access token.")
      end
    elsif cookies.signed[:refresh_token].present?
      user = User.find_by(refresh_token: cookies.signed[:refresh_token])
      if user&.refresh_token_valid?
        begin
          # Call Warden Manager to renew cookies (devise.rb)
          sign_in(user)
        rescue => e
          Rails.logger.error(`Failed to refresh cookies: #{e.message}`)
        end
      else
        render_unauthorized("Couldn't find user or an active refresh token.")
      end
    else
      render_unauthorized("Couldn't find an active session.")
    end
  end

  def render_unauthorized(message)
    render json: {status: 401, message: message}, status: :unauthorized
  end

  private def render_success(message, status_data, data)
    body = {
      status_kind: "success",
      status_message: t("#{controller_name}.#{message}"),
      status_data: status_data,
      data: data
    }

    render json: body, status: :ok, serialize: false
  end

  private

  def render_unprocessable_entity(message, data)
    if ActiveModel::Errors === data
      data = data.group_by_attribute.transform_values do |errors|
        errors.map(&:type)
      end
    end
    body = {
      status_kind: "error",
      status_message: t("#{controller_name}.#{message}"),
      data: data
    }
    render json: body, status: :unprocessable_entity, serialize: false
  end
end

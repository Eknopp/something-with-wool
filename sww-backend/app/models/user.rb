class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :jwt_authenticatable, :jwt_cookie_authenticatable,
    jwt_revocation_strategy: self

  def refresh_token_valid?
    return false unless refresh_token.present?

    refresh_token_secret_key = SecretKeysConfiguration::REFRESH_TOKEN_SECRET
    decoded_token = decode_refresh_token(refresh_token, refresh_token_secret_key)
    return false unless decoded_token

    exp = decoded_token["exp"]
    Time.at(exp) > Time.now
  end

  private

  def decode_refresh_token(token, key)
    JWT.decode(token, key).first
  rescue JWT::DecodeError, JWT::ExpiredSignature
    nil
  end
end

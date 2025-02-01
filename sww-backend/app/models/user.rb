# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  jti                    :string           not null
#  refresh_token          :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_jti                   (jti) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :jwt_authenticatable, :jwt_cookie_authenticatable,
    jwt_revocation_strategy: self

  def refresh_token_valid?
    return false if refresh_token.blank?

    refresh_token_secret_key = SecretKeysConfiguration::REFRESH_TOKEN_SECRET
    decoded_token = decode_refresh_token(refresh_token, refresh_token_secret_key)
    return false unless decoded_token

    exp = decoded_token["exp"]
    Time.zone.at(exp) > Time.zone.now
  end

  private

  def decode_refresh_token(token, key)
    JWT.decode(token, key).first
  rescue JWT::DecodeError, JWT::ExpiredSignature
    nil
  end
end

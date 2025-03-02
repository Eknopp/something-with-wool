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

  has_many :users_yarns
  has_many :yarns, through: :users_yarns
  has_many :patterns
  has_many :projects
  has_many :favorites
  has_many :purchases
  has_many :magazines, -> { where(role: "magazine_publisher") }
  has_many :following, class_name: "Follower", foreign_key: "follwee_id"
  has_many :followers, class_name: "Follower", foreign_key: "follower_id"

  validates :pronouns, inclusion: {in: %w[he/him she/her they/them], message: "%{value} is not a valid pronoun"}
  validates :units, inclusion: {in: %w[metric imperial], message: "%{value} is not a valid measuring unit"}
  validates :role, inclusion: {in: %w[user yarn_disributor magazine_publisher shop admin], message: "%{value} is not a valid user role"}

  def refresh_token_valid?
    return false if refresh_token.blank?

    refresh_token_secret_key = SecretKeysConfiguration::REFRESH_TOKEN_SECRET
    decoded_token = decode_refresh_token(refresh_token, refresh_token_secret_key)
    return false unless decoded_token

    exp = decoded_token["exp"]
    Time.zone.at(exp) > Time.zone.now
  end

  def favorite(item)
    favorites.create(favoritable: item)
  end

  def unfavorite(item)
    favorites.where(favoritable: item).destroy_all
  end

  def favorited?(item)
    favorites.exists?(favoritable: item)
  end

  private

  def decode_refresh_token(token, key)
    JWT.decode(token, key).first
  rescue JWT::DecodeError, JWT::ExpiredSignature
    nil
  end
end

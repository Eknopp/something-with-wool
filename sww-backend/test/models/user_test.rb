# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  biography              :text
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  jti                    :string           not null
#  language               :string           default("en"), not null
#  location               :string
#  name                   :string           default("Anonymous"), not null
#  preferred_currency     :string           default("EUR"), not null
#  pronouns               :string
#  refresh_token          :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :string           default("user"), not null
#  units                  :string           default("metric"), not null
#  username               :string           not null
#  website                :string
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
require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test "user creation" do
    user = User.new(email: "test@example.com", password: "password", username: "testuser")
    assert user.save, "User should be saved successfully"
  end

  test "should log in user" do
    sign_in @user
    # TODO: Add assertion through using a path that only a logged in user can access
  end
end

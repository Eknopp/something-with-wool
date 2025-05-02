require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  fixtures :users

  setup do
    @user = users(:one)
    @password = "password123"
  end

  test "should log in and return access and refresh tokens" do
    login_user(@user, @password)
    assert_response :success

    access_token = response.cookies["access_token"]
    refresh_token = response.cookies["refresh_token"]

    assert access_token.present?
    assert refresh_token.present?
  end

  test "should make a request with only access_token" do
    login_user(@user, @password)
    assert_response :success
    refresh_token = response.cookies["refresh_token"]
    access_token = response.cookies["access_token"]
    assert refresh_token.present?
    assert access_token.present?

    post v1_patterns_url, params: {pattern: create_pattern}, headers: {"Cookie" => "access_token=#{response.cookies["access_token"]}"}
    assert_response :success
  end

  test "should make a request with only refresh_token" do
    login_user(@user, @password)
    assert_response :success

    post v1_patterns_url, params: {pattern: create_pattern}, headers: {"Cookie" => "refresh_token=#{response.cookies["refresh_token"]}"}
    assert_response :success
  end

  # Maybe remove the below since we dont really want to have this situation
  test "should make a request with both refresh_token and access_token" do
    login_user(@user, @password)
    assert_response :success
    refresh_token = response.cookies["refresh_token"]
    access_token = response.cookies["access_token"]
    assert refresh_token.present?
    assert access_token.present?

    post v1_patterns_url, params: {pattern: create_pattern}, headers: {
      "Cookie" => "refresh_token=#{response.cookies["refresh_token"]}; access_token=#{response.cookies["access_token"]}"
    }
    assert_response :success
  end

  test "should not send request without any cookies" do
    login_user(@user, @password)
    assert_response :success
    refresh_token = response.cookies["refresh_token"]
    access_token = response.cookies["access_token"]
    assert refresh_token.present?
    assert access_token.present?

    post v1_patterns_url, params: {pattern: create_pattern}, headers: {
      "Cookie" => ""
    }
    assert_response :unauthorized
  end

  test "should set a new access_token and refresh_token with only refresh_token" do
    login_user(@user, @password)
    assert_response :success

    refresh_token = response.cookies["refresh_token"]
    access_token = response.cookies["access_token"]
    assert refresh_token.present?
    assert access_token.present?

    #  Expire access_token
    cookies["access_token"] = {
      value: access_token,
      expires: 1.second.ago
    }

    # Simulate a request with only the refresh_token
    post v1_patterns_url, params: {pattern: create_pattern}, headers: {"Cookie" => "refresh_token=#{refresh_token}"}
    assert_response :success

    # Check if a new access_token and refresh_token is set
    new_access_token = response.cookies["access_token"]
    new_refresh_toen = response.cookies["refresh_token"]
    assert new_access_token.present?
    refute_equal access_token, new_access_token
    refute_equal refresh_token, new_refresh_toen
  end

  test "should return unauthorized with expired access_token and refresh_token" do
    login_user(@user, @password)
    assert_response :success

    refresh_token = response.cookies["refresh_token"]
    access_token = response.cookies["access_token"]
    assert refresh_token.present?
    assert access_token.present?

    # Expire both access_token and refresh_token cookies
    cookies["access_token"] = {
      value: access_token,
      expires: 1.second.ago
    }
    cookies["refresh_token"] = {
      value: refresh_token,
      expires: 1.second.ago
    }

    # Simulate a request with expired tokens
    post v1_patterns_url, params: {pattern: create_pattern}
    assert_response :unauthorized
  end

  test "should log in, log out, and log in again with different JWTs" do
    # First login
    login_user(@user, @password)
    assert_response :success
    first_access_token = response.cookies["access_token"]
    first_refresh_token = response.cookies["refresh_token"]
    assert first_access_token.present?
    assert first_refresh_token.present?

    # Logout
    delete destroy_user_session_url, headers: {"Cookie" => "access_token=#{first_access_token}; refresh_token=#{first_refresh_token}"}
    assert_response :success

    # Second login
    login_user(@user, @password)
    assert_response :success
    second_access_token = response.cookies["access_token"]
    second_refresh_token = response.cookies["refresh_token"]
    assert second_access_token.present?
    assert second_refresh_token.present?

    # Ensure tokens are different
    refute_equal first_access_token, second_access_token
    refute_equal first_refresh_token, second_refresh_token
  end

  test "should log out with only access_token" do
    login_user(@user, @password)
    assert_response :success
    access_token = response.cookies["access_token"]
    refresh_token = response.cookies["refresh_token"]
    assert access_token.present?
    assert refresh_token.present?

    # Logout with only access_token
    delete destroy_user_session_url, headers: {"Cookie" => "access_token=#{access_token}"}
    assert_response :success

    # Ensure cookies are cleared
    assert_nil response.cookies["access_token"]
    assert_nil response.cookies["refresh_token"]
  end

  test "should log out with only refresh_token" do
    login_user(@user, @password)
    assert_response :success
    access_token = response.cookies["access_token"]
    refresh_token = response.cookies["refresh_token"]
    assert access_token.present?
    assert refresh_token.present?

    # Logout with only refresh_token
    delete destroy_user_session_url, headers: {"Cookie" => "refresh_token=#{refresh_token}"}
    assert_response :success

    # Ensure cookies are cleared
    assert_nil response.cookies["access_token"]
    assert_nil response.cookies["refresh_token"]
  end

  test "should log out after new access token and refresh token generation" do
    login_user(@user, @password)
    assert_response :success

    refresh_token = response.cookies["refresh_token"]
    access_token = response.cookies["access_token"]
    assert refresh_token.present?
    assert access_token.present?

    # Expire access_token
    cookies["access_token"] = {
      value: access_token,
      expires: 1.second.ago
    }

    # Generate a new access token using refresh_token
    post v1_patterns_url, params: {pattern: create_pattern}, headers: {"Cookie" => "refresh_token=#{refresh_token}"}
    assert_response :success

    new_access_token = response.cookies["access_token"]
    assert new_access_token.present?
    refute_equal access_token, new_access_token

    # Logout with the new access_token and refresh_token
    delete destroy_user_session_url, headers: {"Cookie" => "access_token=#{new_access_token}; refresh_token=#{refresh_token}"}
    assert_response :success

    # Ensure cookies are cleared
    assert_nil response.cookies["access_token"]
    assert_nil response.cookies["refresh_token"]
  end

  private

  def create_pattern
    {
      name: "Test Pattern",
      difficulty_rating: 3,
      user_id: @user.id,
      craft_type: "knitting",
      currency: "USD",
      first_published_date: Date.today,
      gauge_pattern: "10x10",
      languages: ["en"],
      likes: 0,
      nbr_rows: 10,
      nbr_stitches: 10,
      notes: "Test notes",
      overall_rating: 4,
      overall_yarn_weight: "fine",
      pdf_path: "path/to/pdf",
      pictures_path: "path/to/pictures",
      price: 10.0,
      release_date: Date.today,
      repeats: 2,
      sizes: ["M"],
      swatch_size: 5,
      total_yardage: 100
    }
  end
end

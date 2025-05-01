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

  test "should set a new access_token with only refresh_token" do
    login_user(@user, @password)
    assert_response :success

    refresh_token = response.cookies["refresh_token"]
    access_token = response.cookies["access_token"]
    assert refresh_token.present?
    assert access_token.present?

    # Expire the access_token cookie
    cookies["access_token"] = {
      value: access_token,
      expires: 1.second.ago
    }

    # Simulate a request with only the refresh_token
    post v1_patterns_url, params: {pattern: create_pattern}, headers: {"Cookie" => "refresh_token=#{refresh_token}"}
    assert_response :success

    # Check if a new access_token is set
    new_access_token = response.cookies["access_token"]
    assert new_access_token.present?
    refute_equal access_token, new_access_token
  end

  # test that with refresh token only, a new access_token is set.
  # test logout with only access_token
  # test logout with only refresh_token
  # logout after new access token generation
  # test that cookies are removed on logout
  # test that when access_token is expired, a new access_token is sent
  # test loging in, out and in again that jwts are different
  # check that refresh token is also renewed when only refresh token is being sent to backend

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

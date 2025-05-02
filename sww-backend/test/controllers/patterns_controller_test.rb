require "test_helper"

class PatternsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  fixtures :users, :followers

  setup do
    @user = users(:one)
    login_user(@user, "password123")

    @pattern_params = {
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

  test "should create pattern" do
    assert_difference("Pattern.count") do
      post v1_patterns_url, params: {pattern: @pattern_params}
    end
    assert_response :success
  end

  test "should not create pattern with invalid data" do
    @pattern_params[:name] = nil
    assert_no_difference("Pattern.count") do
      post v1_patterns_url, params: {pattern: @pattern_params}
    end
    assert_response :unprocessable_entity
  end

  test "should get index" do
    get v1_patterns_url
    assert_response :success
  end

  test "should show pattern" do
    pattern = patterns(:one)
    get v1_pattern_url(pattern)
    assert_response :success
  end

  test "should update pattern" do
    pattern = patterns(:one)
    updated_params = {name: "Updated Pattern Name"}

    patch v1_pattern_url(pattern), params: {pattern: updated_params}
    assert_response :success

    pattern.reload
    assert_equal "Updated Pattern Name", pattern.name
  end

  # TODO:
  # test "should archive pattern" do
  #   pattern = patterns(:one)

  #   patch archive_v1_pattern_url(pattern)
  #   assert_response :success

  #   pattern.reload
  #   assert_not_nil pattern.archived_at
  # end
end

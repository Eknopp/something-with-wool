require "test_helper"

class PatternsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  fixtures :users, :users_yarns, :patterns, :yarns, :projects, :patterns_yarns

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

  test "should create pattern with one project" do
    assert_difference("Pattern.count") do
      post v1_patterns_url, params: {pattern: @pattern_params}
    end
    assert_response :success

    pattern = Pattern.last
    project = projects(:one)
    project.update(pattern_id: pattern.id)

    assert_equal pattern.id, project.pattern_id
  end

  test "should create pattern with two project" do
    assert_difference("Pattern.count") do
      post v1_patterns_url, params: {pattern: @pattern_params}
    end
    assert_response :success

    pattern = Pattern.last
    project_1 = projects(:one)
    project_2 = projects(:two)
    project_1.update(pattern_id: pattern.id)
    project_2.update(pattern_id: pattern.id)

    assert_equal pattern.id, project_1.pattern_id
    assert_equal pattern.id, project_2.pattern_id
  end

  test "should create pattern with one yarn with one color" do
    yarn = yarns(:one)
    @pattern_params[:yarns] = [{yarn_id: yarn.id, color: yarn.colors.first}]

    assert_difference("Pattern.count") do
      post v1_patterns_url, params: {pattern: @pattern_params}
    end
    assert_response :success

    pattern = Pattern.last
    patterns_yarn = pattern.patterns_yarns.last

    assert_equal yarn.id, patterns_yarn.yarn_id
    assert_equal pattern.id, patterns_yarn.pattern_id
    assert_equal yarn.colors.first, patterns_yarn.color
  end

  test "should create pattern with one yarn with two colors" do
    yarn = yarns(:one)
    @pattern_params[:yarns] = [
      {yarn_id: yarn.id, color: yarn.colors[0]},
      {yarn_id: yarn.id, color: yarn.colors[1]}
    ]

    assert_difference("Pattern.count") do
      post v1_patterns_url, params: {pattern: @pattern_params}
    end
    assert_response :success

    pattern = Pattern.last
    patterns_yarns = pattern.patterns_yarns

    patterns_yarns.each do |patterns_yarn|
      assert_equal pattern.id, patterns_yarn.pattern_id
    end

    assert_equal 2, patterns_yarns.count
    assert_equal yarn.id, patterns_yarns[0].yarn_id
    assert_equal yarn.colors[0], patterns_yarns[0].color
    assert_equal yarn.id, patterns_yarns[1].yarn_id
    assert_equal yarn.colors[1], patterns_yarns[1].color
    assert_not_equal yarn.colors[0], patterns_yarns[1].color
    assert_not_equal yarn.colors[1], patterns_yarns[0].color
  end

  test "should create pattern with two yarns with one color" do
    yarn_one = yarns(:one)
    yarn_two = yarns(:two)
    @pattern_params[:yarns] = [
      {yarn_id: yarn_one.id, color: yarn_one.colors.first},
      {yarn_id: yarn_two.id, color: yarn_two.colors.first}
    ]

    assert_difference("Pattern.count") do
      post v1_patterns_url, params: {pattern: @pattern_params}
    end
    assert_response :success

    pattern = Pattern.last
    patterns_yarn = pattern.patterns_yarns

    assert_equal yarn_one.id, patterns_yarn.first.yarn_id
    assert_equal yarn_two.id, patterns_yarn.second.yarn_id

    patterns_yarns.each do |patterns_yarn|
      assert_equal pattern.id, patterns_yarn.pattern_id
    end
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

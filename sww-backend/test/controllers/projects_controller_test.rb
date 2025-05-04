require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  fixtures :users, :projects, :patterns

  setup do
    @user = users(:one)
    login_user(@user, "password")

    @project_params = {
      name: "Test Project",
      status: "in_queue",
      project_started: nil,
      project_finished: nil,
      pattern_id: patterns(:one).id,
      user_id: @user.id,
      rows: 10,
      stitches: 10,
      swatch_size: "5x5",
      size: "M",
      notes: "Test notes"
    }
  end

  test "should create project" do
    assert_difference("Project.count") do
      post v1_projects_url, params: {project: @project_params}
    end
    assert_response :success
  end

  test "should not create project with invalid data" do
    @project_params[:name] = nil
    assert_no_difference("Project.count") do
      post v1_projects_url, params: {project: @project_params}
    end
    assert_response :unprocessable_entity
  end

  test "should get index" do
    get v1_projects_url
    assert_response :success
  end

  test "should show project" do
    project = projects(:one)
    get v1_project_url(project)
    assert_response :success
  end

  test "should update project" do
    project = projects(:one)
    updated_params = {name: "Updated Project Name"}

    patch v1_project_url(project), params: {project: updated_params}
    assert_response :success

    project.reload
    assert_equal "Updated Project Name", project.name
  end

  test "should destroy project" do
    project = projects(:one)
    assert_difference("Project.count", -1) do
      delete v1_project_url(project)
    end
    assert_response :success
  end
end

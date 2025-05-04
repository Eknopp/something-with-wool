ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    include Devise::Test::IntegrationHelpers
    include Rails.application.routes.url_helpers
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    # fixtures :all

    def login_user(user, password)
      user.password = password
      user.save!

      post user_session_path, params: {user: {email: user.email, password: password}}, as: :json
      assert_response :success

      @cookies = @response.cookies
    end
  end
end

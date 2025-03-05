class V1::Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  # Hiding linter, create is being used behind the scenes by devise
  # rubocop:disable LexicallyScopedActionFilter
  before_action :configure_sign_up_params, only: [:create]
  # rubocop:enable LexicallyScopedActionFilter

  def sign_up(resource_name, resource)
    sign_in resource, store: false
  end

  private

  def respond_with(resource, _opts = {})
    if request.method == "POST" && resource.persisted?
      render json: {
        status: {code: 200, message: "Signed up sucessfully."},
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }, status: :ok
    elsif request.method == "DELETE"
      render json: {
        status: {code: 200, message: "Account deleted successfully."}
      }, status: :ok
    else
      render json: {
        status: {code: 422, message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}"}
      }, status: :unprocessable_entity
    end
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end

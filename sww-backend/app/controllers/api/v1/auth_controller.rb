class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:login]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def login 
        if @user = User.authenticate_by(login_params)
          @token = encode_token(user_id: @user.id)
          render json: {
              user: UserSerializer.new(@user),
              token: @token
          }, status: :accepted
      else
          render json: {message: 'Incorrect password'}, status: :unauthorized
      end

  end

  private 

  def login_params 
      params.permit(:email_address, :password)
  end

  def handle_record_not_found(e)
      render json: { message: "User doesn't exist" }, status: :unauthorized
  end
end

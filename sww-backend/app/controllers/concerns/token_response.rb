module TokenResponse
  def generate_and_set_tokens(resource)
    refresh_token = generate_refresh_token(resource)
    resource.update(refresh_token: refresh_token)
    cookies.signed[:refresh_token] = {
      value: refresh_token,
      httponly: true,
      expires: 1.month.from_now,
      secure: !Rails.env.test?
    }

    access_token = generate_access_token(resource)
    cookies[:access_token] = {
      value: access_token,
      httponly: true,
      expires: 15.minutes.from_now,
      secure: !Rails.env.test?,
      same_site: :strict
    }
  end

  def generate_refresh_token(resource)
    jti = SecureRandom.uuid
    exp = 1.month.from_now.to_i
    refresh_token_secret_key = SecretKeysConfiguration::REFRESH_TOKEN_SECRET
    JWT.encode({user_id: resource.id, exp: exp, jti: jti}, refresh_token_secret_key)
  end

  def generate_access_token(resource)
    jti = SecureRandom.uuid
    exp = 15.minutes.from_now.to_i
    access_token_secret_key = SecretKeysConfiguration::ACCESS_TOKEN_SECRET
    JWT.encode({user_id: resource.id, exp: exp, jti: jti}, access_token_secret_key)
  end
end

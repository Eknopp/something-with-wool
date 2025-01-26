# TODO: use a separate key base for refresh token?
module SecretKeysConfiguration
  def self.fetch_key(key)
    Rails.application.credentials.fetch(key)
  end

  SECRET_KEY_BASE = fetch_key(:secret_key_base)
  ACCESS_TOKEN_SECRET = fetch_key(:access_token_secret)
  REFRESH_TOKEN_SECRET = fetch_key(:refresh_token_secret)
end

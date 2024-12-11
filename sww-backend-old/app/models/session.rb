class Session < ApplicationRecord
  belongs_to :user
  before_create :generate_token
  
  private
  # TODO: Generate JWT token instead, maybe call encode_token from App controller?
  def generate_token # Here implement, generate the token as you wish.
    self.token = Digest::SHA1.hexdigest([ Time.now, rand ].join)
  end
end

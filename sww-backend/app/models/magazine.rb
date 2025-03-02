class Magazine < ApplicationRecord
  has_many :patterns_magazines
  has_many :patterns, through: :patterns_magazines

  belongs_to :user
  validate :user_must_be_magazine_publisher

  has_many :issues
end

def user_must_be_magazine_publisher
  errors.add(:user, "must be a magazine publisher") unless user.role == "magazine_publisher"
end

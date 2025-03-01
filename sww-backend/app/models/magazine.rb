class Magazine < ApplicationRecord
  has_many :patterns_magazines
  has_many :patterns, through: :patterns_magazines
  # TODO: belongs to user of role magazine_publisher
  belongs_to :user
  has_many :issues
end

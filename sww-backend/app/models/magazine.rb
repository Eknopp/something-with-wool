class Magazine < ApplicationRecord
  has_many :patterns_magazines
  has_many :patterns, through: :patterns_magazines
  belongs_to :user
end

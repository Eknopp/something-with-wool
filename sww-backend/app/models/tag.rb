class Tag < ApplicationRecord
  has_many :patterns_tags
  has_many :patterns, through: :patterns_tags
end

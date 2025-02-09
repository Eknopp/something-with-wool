class Hook < ApplicationRecord
  has_many :patterns_hooks
  has_many :patterns, through: :patterns_hooks
end

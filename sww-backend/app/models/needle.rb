class Needle < ApplicationRecord
  has_many :patterns_needles
  has_many :patterns, through: :patterns_needles
end

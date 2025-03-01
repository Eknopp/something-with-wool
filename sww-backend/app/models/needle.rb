class Needle < ApplicationRecord
  has_many :patterns_needles
  has_many :patterns, through: :patterns_needles
  has_many :projects_needles
  has_many :projects, through: :projects_needles
  has_many :yarns_needles
  has_many :yarns, through: :yarns_needles
end
